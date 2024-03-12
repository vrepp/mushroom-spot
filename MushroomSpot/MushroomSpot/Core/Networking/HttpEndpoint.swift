//
//  HttpEndpoint.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

import Foundation

struct HttpBaseUrl: RawRepresentable {
    var rawValue: String
}

final class HttpEndpoint<HttpResponse: Decodable> {
    typealias HttpParameters = [String: Any]
    typealias HttpPath = String

    enum HttpMethod: String {
        case get = "GET"
        case post = "POST"
    }

    let method: HttpMethod
    let baseUrl: HttpBaseUrl
    let path: HttpPath
    let parameters: Encodable?
    let decode: (Data) throws -> HttpResponse

    init(method: HttpMethod = .get, baseUrl: HttpBaseUrl, path: HttpPath, parameters: Encodable? = nil, decode: @escaping (Data) throws -> HttpResponse) {
        self.method = method
        self.baseUrl = baseUrl
        self.path = path
        self.parameters = parameters
        self.decode = decode
    }
}

extension HttpEndpoint {

    convenience init(method: HttpMethod = .get, baseUrl: HttpBaseUrl, path: HttpPath, parameters: Encodable? = nil) {
        self.init(method: method, baseUrl: baseUrl, path: path, parameters: parameters) {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            return try jsonDecoder.decode(HttpResponse.self, from: $0)
        }
    }

    func urlRequest() throws -> URLRequest {
        guard let url = URL(string: baseUrl.rawValue)?.appendingPathComponent(path) else {
            throw HttpError.invalidURL(baseUrl.rawValue + path)
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue

        switch method {
        case .get:
            var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
            urlComponents?.queryItems = parameters?.asQueryItems()

            if let url = urlComponents?.url {
                urlRequest.url = url
            }

        case .post:
            urlRequest.httpBody = parameters?.asJsonData()
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        }

        return urlRequest
    }
}
