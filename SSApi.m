//
//
//	Copyright (c) 2017 Scott Ban
//  Email:scottban@126.com (Only accept company sending new job invitation ^^)
//	https://github.com/reference/SSApi
//
//
//	Permission is hereby granted, free of charge, to any person obtaining a
//	copy of this software and associated documentation files (the "Software"),
//	to deal in the Software without restriction, including without limitation
//	the rights to use, copy, modify, merge, publish, distribute, sublicense,
//	and/or sell copies of the Software, and to permit persons to whom the
//	Software is furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//	FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//	IN THE SOFTWARE.
//

#import "SSApi.h"
#import "AFNetworking.h"

@implementation SSApi

+ (NSString *)fullPathWithAPI:(API)api dir:(HostDir)dir
{
    NSMutableString *fullPath = [NSMutableString stringWithFormat:@"%@%@",HOST,PATH];
    
    switch (dir) {
        case HostDir_<#目录类型#>:
        {
            [fullPath appendString:DIR_<#目录类型#>];
        }
            break;
        default:
            break;
    }
    
    switch (api) {
        case API_<#API#>:
        {
            [fullPath appendString:<#api路径#>];
        }
            break;
        default:
            break;
    }
    return fullPath;
}

+ (void)request<#目录类型#>WithType:(ReqType)typ
                           API:(API)api
                        params:(NSDictionary *)params
                       success:(void (^)(NSDictionary *responseInfo))success
                        failed:(void (^)(NSError *error))failed
{
    [self requestWithType:typ
                  hostDir:HostDir_<#目录类型#>
                      API:api
                   params:params
                  success:success failed:failed];
}

+ (void)requestWithType:(ReqType)typ
                hostDir:(HostDir)dir
                    API:(API)api
                 params:(NSDictionary *)params
                success:(void (^)(NSDictionary *responseInfo))success
                 failed:(void (^)(NSError *error))failed
{
    NSString *fullPath = [CloudAPI fullPathWithAPI:api dir:dir];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //设置请求头
    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    manager.requestSerializer = requestSerializer;
    
    manager.securityPolicy.allowInvalidCertificates=YES;
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"application/json"];
    
#if DEBUG
    NSLog(@"\n【请求】接口：%@ \n 参数：%@\n",fullPath, params);
#endif
    
    
    switch (typ) {
        case ReqType_Post:
        {
            //post
            [manager POST:fullPath parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //返回的正文数据
                NSDictionary *jsonObject = (NSDictionary*)responseObject;
#if DEBUG
                NSLog(@"\n【响应】接口：%@ \n 返回数据：%@\n",fullPath, jsonObject);
#endif
                NSNumber *code = [jsonObject objectForKey:@"responseCode"];
                if ([code isEqualToNumber:@200]) {
                    //请求成功
                    if (success) {
                        success(jsonObject);
                    }
                }
                else{
                    //失败
                    if (failed) {
                        NSError *err = [NSError errorWithDomain:fullPath code:[code integerValue] userInfo:jsonObject];
                        failed(err);
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //网络问题,存入数据库，稍后重新请求
                NSLog(@"\n接口：%@ \n 网络请求错误：%@\n",fullPath, error);
                if (failed) {
                    failed(error);
                }
            }];
        }
            break;
            
        case ReqType_Put:
        {
            //put
            [manager PUT:fullPath parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //返回的正文数据
                NSDictionary *jsonObject = (NSDictionary*)responseObject;
#if DEBUG
                NSLog(@"\n【响应】接口：%@ \n 返回数据：%@\n",fullPath, jsonObject);
#endif
                NSNumber *code = [jsonObject objectForKey:@"responseCode"];
                if ([code isEqualToNumber:@200]) {
                    //请求成功
                    if (success) {
                        success(jsonObject);
                    }
                }
                else{
                    //失败
                    if (failed) {
                        NSError *err = [NSError errorWithDomain:fullPath code:[code integerValue] userInfo:jsonObject];
                        failed(err);
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //网络问题,存入数据库，稍后重新请求
                NSLog(@"\n接口：%@ \n 网络请求错误：%@\n",fullPath, error);
                if (failed) {
                    failed(error);
                }
            }];
        }
            break;
            
        case ReqType_Get:
        {
            //get
            [manager GET:fullPath parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //返回的正文数据
                NSDictionary *jsonObject = (NSDictionary*)responseObject;
#if DEBUG
                NSLog(@"\n【响应】接口：%@ \n 返回数据：%@\n",fullPath, jsonObject);
#endif
                NSNumber *code = [jsonObject objectForKey:@"responseCode"];
                if ([code isEqualToNumber:@200]) {
                    //请求成功
                    if (success) {
                        success(jsonObject);
                    }
                }
                else{
                    //失败
                    if (failed) {
                        NSError *err = [NSError errorWithDomain:fullPath code:[code integerValue] userInfo:jsonObject];
                        failed(err);
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //网络问题,存入数据库，稍后重新请求
                NSLog(@"\n接口：%@ \n 网络请求错误：%@\n",fullPath, error);
                if (failed) {
                    failed(error);
                }
            }];
        }
            break;
            
        case ReqType_Delete:
        {
            //delete
            [manager DELETE:fullPath parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //返回的正文数据
                NSDictionary *jsonObject = (NSDictionary*)responseObject;
#if DEBUG
                NSLog(@"\n【响应】接口：%@ \n 返回数据：%@\n",fullPath, jsonObject);
#endif
                NSNumber *code = [jsonObject objectForKey:@"responseCode"];
                if ([code isEqualToNumber:@200]) {
                    //请求成功
                    if (success) {
                        success(jsonObject);
                    }
                }
                else{
                    //失败
                    if (failed) {
                        NSError *err = [NSError errorWithDomain:fullPath code:[code integerValue] userInfo:jsonObject];
                        failed(err);
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //网络问题,存入数据库，稍后重新请求
                NSLog(@"\n接口：%@ \n 网络请求错误：%@\n",fullPath, error);
                if (failed) {
                    failed(error);
                }
            }];
            
        }
            break;
        default:
            break;
    }
}

@end
