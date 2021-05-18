import 'dart:html';
import 'package:dio/dio.dart';
import 'http_request.dart';

/// HTTP 请求静态化
class Http {
  /// 初始化公共属性，如果需要覆盖原配置项，就调用它
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时时间
  /// [receiveTimeout] 接收超时时间
  /// [headers] 请求头
  /// [interceptors] 基础连接器
  static void init({
    String baseUrl,
    int connectTimeout,
    int receiveTimeout,
    Map<String, dynamic> headers,
    List<Interceptor> interceptors,
  }) {
    HttpRequest().init(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: headers,
      interceptors: interceptors,
    );
  }

  /// 设置请求头
  static void setHeaders(Map<String, dynamic> headers) {
    HttpRequest().setHeaders(headers);
  }

  /// 取消请求
  static void cancelRequests(CancelToken token) {
    HttpRequest().cancelRequests(token);
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
  static Future get(String path, {
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    return await HttpRequest().get(
      path,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// POST请求
  static Future post(String path, {
    Map<String, dynamic> params,
    dynamic data,
    Options options,
    CancelToken cancelToken,
  }) async {
    return await HttpRequest().post(
      path,
      params: params,
      data: data,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// 表单提交
  static Future postForm(String path, {
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    return await HttpRequest().postForm(
      path,
      params: params,
      options: options,
      cancelToken: cancelToken
    );
  }

}