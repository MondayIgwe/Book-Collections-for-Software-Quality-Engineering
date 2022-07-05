using RestSharp;
using RestSharp.Authenticators;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace Kantar_BDD.Support.Utils
{
    public class RestService
    {
        public string BaseURL { get; set; }
        public RestClient RestClient { get; set; }
        private IAuthenticator? Authenticator { get; set; }

        public RestService(string baseUrl) 
        {
            BaseURL = baseUrl;
            RestClient = new RestClient(baseUrl);
            
        }

        public RestService(string baseUrl, IAuthenticator authenticator)
        {
            BaseURL = baseUrl;
            RestClient = new RestClient(baseUrl);
            Authenticator = authenticator;
        }

        public async Task<RestResponse> Get(string endpoint, Dictionary<string,string> parameters =null) 
        {
            var request = new RestRequest(endpoint);
            if (parameters != null) 
            {
                foreach (var parameter in parameters)
                {
                    request.AddQueryParameter(parameter.Key, parameter.Value);
                }
            }

            if (Authenticator != null) 
            {
                RestClient.Authenticator = Authenticator;
            }

            return await RestClient.GetAsync(request);                
        }

        public async Task<RestResponse> Post(string endpoint, object body, Dictionary<string, string> parameters = null) 
        {
            var request = new RestRequest(endpoint);
            if (parameters != null)
            {
                foreach (var parameter in parameters)
                {
                    request.AddQueryParameter(parameter.Key, parameter.Value);
                }
            }
            request.AddJsonBody(body);

            if (Authenticator != null)
            {
                RestClient.Authenticator = Authenticator;
            }

            return await RestClient.ExecutePostAsync(request);
        }

        public async Task<RestResponse> Put(string endpoint, object body, Dictionary<string, string> parameters = null)
{
            var request = new RestRequest(endpoint);
            if (parameters != null)
            {
                foreach (var parameter in parameters)
                {
                    request.AddQueryParameter(parameter.Key, parameter.Value);
                }
            }
            request.AddJsonBody(body);

            if (Authenticator != null)
            {
                RestClient.Authenticator = Authenticator;
            }

            return await RestClient.ExecutePutAsync(request);
        }

        public async Task<RestResponse> Delete(string endpoint, Dictionary<string, string> parameters = null) 
        {
            var request = new RestRequest(endpoint);
            if (parameters != null)
            {
                foreach (var parameter in parameters)
                {
                    request.AddQueryParameter(parameter.Key, parameter.Value);
                }
            }

            if (Authenticator != null)
            {
                RestClient.Authenticator = Authenticator;
            }

            return await RestClient.DeleteAsync(request);
        }

    }
}