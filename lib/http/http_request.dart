import 'package:dio/dio.dart';
import 'package:flutterkit/http/http_options.dart';
import 'package:flutterkit/http/http_interceptor.dart';

/// HTTP 请求单例类
class HttpRequest {
  /// 工厂构造方法
  factory HttpRequest() => _instance;
  /// 初始化一个单例实例
  static final HttpRequest _instance = HttpRequest._internal();
  /// Dio 实例
  Dio dio;
  /// 内部构造方法
  HttpRequest._internal() {
    if (dio == null) {
      /// BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增
      BaseOptions baseOptions = BaseOptions(
        baseUrl: HttpOptions.BASE_URL,
        connectTimeout: HttpOptions.CONNECT_TIMEOUT,
        receiveTimeout: HttpOptions.RECEIVE_TIMEOUT,
        headers: {}
      );
      dio = Dio(baseOptions);
      /// 添加拦截器
      dio.interceptors.add(HttpInterceptor());
    }
  }

  /// 初始化公共属性，如果需要覆盖原配置项，就调用它
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时时间
  /// [receiveTimeout] 接收超时时间
  /// [headers] 请求头
  /// [interceptors] 基础连接器
  void init({
    String baseUrl,
    int connectTimeout,
    int receiveTimeout,
    Map<String, dynamic> headers,
    List<Interceptor> interceptors,
  }) {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = connectTimeout;
    dio.options.receiveTimeout = receiveTimeout;
    dio.options.headers = headers;
    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors..addAll(interceptors);
    }
  }

  /// 设置请求头
  void setHeaders(Map<String, dynamic> headers) {
    dio.options.headers.addAll(headers);
  }

  CancelToken _cancelToken = CancelToken();

 /*
  * 取消请求
  *
  * 同一个 cancel token 可以用于多个请求
  * 当一个 cancel token 取消时，所有使用该 cancel token 的请求都会被取消
  * 所有参数可选
  */
  void cancelRequests(CancelToken token) {
    token ?? _cancelToken.cancel("cancelled");
  }

  /// 设置鉴权请求头
  Options setAuthorizationHeader(Options requestOptions) {
    String _token;
    if (_token != null) {
      requestOptions.headers["token"] = _token;
    }
    return requestOptions;
  }

  /// GET请求
  Future get(String path, {
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    Options requestOptions = setAuthorizationHeader(options ?? Options());

    Response response = await dio.get(
      path,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  /// POST请求
  Future post(String path, {
    Map<String, dynamic> params,
    dynamic data,
    Options options,
    CancelToken cancelToken,
  }) async {
    Options requestOptions = setAuthorizationHeader(options ?? Options());

    Response response = await dio.post(
      path,
      data: data,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  /// 表单提交
  Future postForm(String path, {
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    Options requestOptions = setAuthorizationHeader(options ?? Options());

    Response response = await dio.post(
      path,
      data: FormData.fromMap(params),
      options: requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }
  
}