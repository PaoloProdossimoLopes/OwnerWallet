//
//  OwnerRequest.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 15/01/22.
//

import Foundation

open class OwnerRequester: NSObject {
    
    public override init() {}
    
    public func performURL<T: Codable>(
        _ request: RequestProtocol, type expect: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
        startperformPrinter()
        
        guard let url = URL(string: request.urlString) else {
            DEBUGParseErrorPrinter(request)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            [weak self] rawData, rawResponse, rawError in
            
            guard let self = self else { return }
            
            let response = self.reponseHandle(request: request, response: rawResponse)
            
            self.dispachHandler(
                response: response, rawError: rawError,  rawData: rawData,
                type: T.self, completion: completion
            )
        }
        
        task.resume()
    }
    
    //MARK: - Handlers
    
    private func dispachHandler<T: Codable>(
        response: HTTPURLResponse?, rawError: Error?,
        rawData: Data?, type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        DispatchQueue.main.async { [weak self] in
            guard let currenteSelf = self else { return }
            
            if let error = rawError {
                currenteSelf.serviceErrorHandler(
                    http: response, error: error, completion: completion
                )
            } else {
                currenteSelf.dataHandler(
                    rawData, type: T.self, completion: completion
                )
            }
        }
    }
    
    private func reponseHandle(
        request: RequestProtocol, response: URLResponse?
    ) -> HTTPURLResponse? {
        guard let httpResponse = response as? HTTPURLResponse else { return nil }
        DEBUGResponsePrinter(request: request, response: httpResponse)
        return httpResponse
    }
    
    private func serviceErrorHandler<T: Codable>(
        http: HTTPURLResponse?, error: Error, completion: (Result<T, Error>) -> Void
    ) {
        let errorCode = OwnerServiceError(rawValue: http?.statusCode ?? 504)
        DEBUGServiceErrorPrinter(error: errorCode ?? .timeOut)
        completion(.failure(error))
    }
    
    private func dataHandler<T: Codable>(
        _ data: Data?, type: T.Type,
        completion: (Result<T, Error>) -> Void
    ) {
        
        guard let data = data else { return }
        
        do {
            let object = try JSONDecoder().decode(type.self, from: data)
            DEBUGSuccessDecoderPrinter(data)
            endPerformPrinter()
            completion(.success(object))
            
        } catch DecodingError.keyNotFound(_, _) {
            let error = OwnerDecodeError.keyNotFound
            DEBUGDecoderErrorPrinter(error)
            completion(.failure(error))
            
        } catch DecodingError.typeMismatch(_, _) {
            let error = OwnerDecodeError.typeMisMatch
            DEBUGDecoderErrorPrinter(error)
            completion(.failure(error))
            
        } catch DecodingError.valueNotFound(_, _) {
            let error = OwnerDecodeError.valueNotFound
            DEBUGDecoderErrorPrinter(error)
            completion(.failure(error))
            
        }  catch DecodingError.dataCorrupted(_) {
            let error = OwnerDecodeError.dataCorrupted
            DEBUGDecoderErrorPrinter(error)
            completion(.failure(error))
            
        } catch {
            let error = OwnerDecodeError.defaultError
            DEBUGDecoderErrorPrinter(error)
            completion(.failure(error))
        }
        
    }
    
    //MARK: - Printers
    
    private func startperformPrinter() {
        print("\n\n📡 <<<<<<<<<<| START PERFORM |>>>>>>>>>> 📡\n")
    }
    
    private func endPerformPrinter() {
        print("\n📡 <<<<<<<<<<|  END  PERFORM |>>>>>>>>>> 📡\n\n")
    }
    
    private func startHeaderPrinter() -> String {
        return "--------| START |-------"
    }
    
    private func endFooterPrinter() -> String {
        return "--------|  END  |-------"
    }
    
    private func DEBUGDecoderErrorPrinter(_ error: OwnerDecodeError) {
        let message = """
        
          \(startHeaderPrinter())
            ❌ DEBUG: Decoding Error ❌
            ❗️DESCRIBE: \(error.decribeError)
            ❗️ENUM: \(error)
            ❗️LOCALIZED DESCRIPTION: \(error.localizedDescription)
          \(endFooterPrinter())
        
        """
        print(message)
        
        endPerformPrinter()
    }
    
    private func DEBUGParseErrorPrinter(_ request: RequestProtocol) {
        let message = """
        
          \(startHeaderPrinter())
            ❌ DEBUG: BAD URL AT \(request.autoDescribing) ❌
            ❗️DESCRIBE: That URL is Invalid, plese check if its ok.
          \(endFooterPrinter())
                
        """
        print(message)
        
        endPerformPrinter()
    }
    
    private func DEBUGServiceErrorPrinter(
        error: OwnerServiceError
    ) {
        let message = """
        
          \(startHeaderPrinter())
            ❌ DEBUG: Service Error ❌
            ❗️DESCRIBE: \(error.decribeError)
          \(endFooterPrinter())
        
        """
        print(message)
        
        endPerformPrinter()
    }

    private func DEBUGResponsePrinter(request: RequestProtocol, response: HTTPURLResponse) {
        //TODO: Criar status code message (enum)
        let isSuccessfull: Bool = response.statusCode == 200
        let statusImageText = isSuccessfull ? "✅" : "❌"
        let statusMessageText = isSuccessfull ? "SUCCESS" : "FAILURE"
        let message = """
        
          \(startHeaderPrinter())
            📥 DEBUG: Response 📥
            \(statusImageText) STATUS: \(statusMessageText)
            ▶️ ENDPOINT: \(request.urlString)
            ▶️ STATUS CODE: \(response.statusCode)
          \(endFooterPrinter())
        
        """
        print(message)
    }
    
    private func DEBUGSuccessDecoderPrinter(_ data: Data) {
        
        let json = String(data: data, encoding: .utf8) ?? ""
        
        let message = """
        
          \(startHeaderPrinter())
            ✅ DECODER OBJECT SUCCEED
            📝 JSON RECIEVED:
            \(json)
          \(endFooterPrinter())
        
        """
        
        print(message)
    }
    
}
