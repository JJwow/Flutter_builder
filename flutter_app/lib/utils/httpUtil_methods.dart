import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
var httpUtil = HttpUtil(
    baseUrl:"http://localhost:9000/getUser",
    header:headers
);
var httpUtilJson = HttpUtil(
    baseUrl:"http://localhost:9000/getUser",
    header:headersJson
);

//普通格式的header
Map<String, dynamic> headers = {
  "Accept":"application/json",
//  "Content-Type":"application/x-www-form-urlencoded",
};
//json格式的header
Map<String, dynamic> headersJson = {
  "Accept":"application/json",
  "Content-Type":"application/json; charset=UTF-8",
};
class HttpUtil {
  Dio dio;
  BaseOptions options;

  HttpUtil({String baseUrl= "http://localhost:9000/getUser",Map<String, dynamic> header}) {
    print('dio赋值');
    // 或者通过传递一个 `options`来创建dio实例
    options = BaseOptions(
      // 请求基地址，一般为域名，可以包含路径
      baseUrl: baseUrl,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,
      //[如果返回数据是json(content-type)，dio默认会自动将数据转为json，无需再手动转](https://github.com/flutterchina/dio/issues/30)
      responseType:ResponseType.plain,
      ///  响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
      ///  [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
      ///  注意: 这并不是接收数据的总时限.
      receiveTimeout: 3000,
      headers: header,
    );
    dio = new Dio(options);
    dio.interceptors.add(CookieManager(CookieJar()));
  }

  get(url, {data, options, cancelToken}) async {
    print('get请求启动! url：$url ,body: $data');
    Response response;
    try {
      response = await dio.get(
        url,
        cancelToken: cancelToken,
      );
      print('get请求成功!response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      }
      print('get请求发生错误：$e');
    }
    return response.data;
  }

  post(url, {data, options, cancelToken}) async {
    print('post请求启动! url：$url ,body: $data');
    Response response;
    try {
      response = await dio.post(
        url,
        data: data,
      );
      print('post请求成功!response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消! ' + e.message);
      }
      print('post请求发生错误：$e');
    }
    return response.data;
  }
}
