package tera;

public interface ApplicationController {
	// RequestContextのFactoryMethod
	RequestContext getRequest(Object request);

	// ResponseContextのFactoryMethod
	ResponseContext handleRequest(RequestContext requestContext);

	// 必要に応じて例外宣言を加える
	void handleResponse(RequestContext requestContext, ResponseContext responseContext);
}
