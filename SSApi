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

#import <Foundation/Foundation.h>

#define HOST @"<#HOST#>"
#define PATH @"<#PATH#>"
#define DIR_<#任意目录#> @"<#任意目录#>"

typedef enum {
    API_<#此处写api的类型#>,
    
}API;

//请求的类型
typedef enum {
    ReqType_Post = 0,
    ReqType_Put,
    ReqType_Get,
    ReqType_Delete
}ReqType;

typedef enum {
    HostDir_<#自定义目录#> = 0
}HostDir;

@interface SSApi : NSObject

+ (void)requestWithType:(ReqType)typ
                hostDir:(HostDir)dir
                    API:(API)api
                 params:(NSDictionary *)params
                success:(void (^)(NSDictionary *responseInfo))success
                 failed:(void (^)(NSError *error))failed;

+ (void)request<#目录类型#>WithType:(ReqType)typ
                           API:(API)api
                        params:(NSDictionary *)params
                       success:(void (^)(NSDictionary *responseInfo))success
                        failed:(void (^)(NSError *error))failed;
@end
