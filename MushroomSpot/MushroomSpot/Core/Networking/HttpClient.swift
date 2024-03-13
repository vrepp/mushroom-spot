//
//  HttpClient.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

import Foundation

protocol HttpClientProvider: AnyObject {
    typealias HttpHeaders = [String: String]

    func performRequest<T: Decodable>(endpoint: HttpEndpoint<T>) async throws -> T

    var urlSession: URLSession { get }
    var httpHeaders: HttpHeaders? { get }
}

final class HttpClient: HttpClientProvider {
    let urlSession: URLSession
    let httpHeaders: HttpHeaders?
    let authToken: String?

    init(urlSession: URLSession = .shared, httpHeaders: HttpHeaders? = nil, authToken: String? = nil) {
        self.urlSession = urlSession
        self.httpHeaders = httpHeaders
        self.authToken = authToken
    }

    /// Perform HTTP request
    func performRequest<T>(endpoint: HttpEndpoint<T>) async throws -> T where T: Decodable {
        var urlRequest = try endpoint.urlRequest()
        httpHeaders?.forEach { (key: String, value: String) in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }

        if let authToken {
            urlRequest.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        }

        let (data, response) = try await urlSession.data(for: urlRequest, delegate: nil)
        guard let response = response as? HTTPURLResponse else {
            throw HttpError.noResponse
        }

        switch response.statusCode {
            case 200...299:
                do {
                    let decodedResponse = try endpoint.decode(data)
                    return decodedResponse
                } catch {
                    throw HttpError.decode(error)
                }

            case 400:
                throw HttpError.badRequest(data)

            case 401:
                throw HttpError.unauthorized

            default:
                throw HttpError.unexpectedStatusCode(response.statusCode)
        }
    }
}
