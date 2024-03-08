import http from '@ohos.net.http'
class Response{
  code:number
  message:string
  data:any
}

export function  request(url:string,method: http.RequestMethod,data?:any): Promise<Response> {
  const BASE_URL =  "http://localhost:8080/"
  let httpRequest = http.createHttp();
  let responseResult = httpRequest.request( BASE_URL+ url,{
    method: method,
    // header: {
    //   'Content-Type': 'application/json'
    // },
    extraData: JSON.stringify(data),
    // 可选，指定返回数据的类型
    // expectDataType: http.HttpDataType.STRING,
    // 可选，默认为true
    // usingCache: true,
    // 可选，默认为1
    // priority: 1,
    // 可选，默认为60000ms
    // connectTimeout: 60000,
    // readTimeout: 60000,
    // 可选，协议类型默认值由系统自动指定
    // usingProtocol: http.HttpProtocol.HTTP1_1,
  });
  let response = new Response();
  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode === 200) {
      let res: Response = JSON.parse(`${value.result}`);
      if (res.code==null&&response.message ==null){
        response.data=res
      }else {
        response.data = res.data;
        response.code = res.code;
        response.message = res.message;
      }
    } else {
      response.message = '请求错误';
      response.code = 400;
    }
    return response;
  }).catch(() => {
    response.message = '请求错误';
    response.code = 400;
    return response;
  });
}