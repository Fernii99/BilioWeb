//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.42000
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Proy_BibliotecaWeb.ServicioLibros {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServicioLibros.LibrosSoap")]
    public interface LibrosSoap {
        
        // CODEGEN: Se está generando un contrato de mensaje, ya que el nombre de elemento HelloWorldResult del espacio de nombres http://tempuri.org/ no está marcado para aceptar valores nil.
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/HelloWorld", ReplyAction="*")]
        Proy_BibliotecaWeb.ServicioLibros.HelloWorldResponse HelloWorld(Proy_BibliotecaWeb.ServicioLibros.HelloWorldRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/HelloWorld", ReplyAction="*")]
        System.Threading.Tasks.Task<Proy_BibliotecaWeb.ServicioLibros.HelloWorldResponse> HelloWorldAsync(Proy_BibliotecaWeb.ServicioLibros.HelloWorldRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/RecuperarLibros", ReplyAction="*")]
        void RecuperarLibros();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/RecuperarLibros", ReplyAction="*")]
        System.Threading.Tasks.Task RecuperarLibrosAsync();
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class HelloWorldRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="HelloWorld", Namespace="http://tempuri.org/", Order=0)]
        public Proy_BibliotecaWeb.ServicioLibros.HelloWorldRequestBody Body;
        
        public HelloWorldRequest() {
        }
        
        public HelloWorldRequest(Proy_BibliotecaWeb.ServicioLibros.HelloWorldRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute()]
    public partial class HelloWorldRequestBody {
        
        public HelloWorldRequestBody() {
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class HelloWorldResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="HelloWorldResponse", Namespace="http://tempuri.org/", Order=0)]
        public Proy_BibliotecaWeb.ServicioLibros.HelloWorldResponseBody Body;
        
        public HelloWorldResponse() {
        }
        
        public HelloWorldResponse(Proy_BibliotecaWeb.ServicioLibros.HelloWorldResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class HelloWorldResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string HelloWorldResult;
        
        public HelloWorldResponseBody() {
        }
        
        public HelloWorldResponseBody(string HelloWorldResult) {
            this.HelloWorldResult = HelloWorldResult;
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface LibrosSoapChannel : Proy_BibliotecaWeb.ServicioLibros.LibrosSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class LibrosSoapClient : System.ServiceModel.ClientBase<Proy_BibliotecaWeb.ServicioLibros.LibrosSoap>, Proy_BibliotecaWeb.ServicioLibros.LibrosSoap {
        
        public LibrosSoapClient() {
        }
        
        public LibrosSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public LibrosSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public LibrosSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public LibrosSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        Proy_BibliotecaWeb.ServicioLibros.HelloWorldResponse Proy_BibliotecaWeb.ServicioLibros.LibrosSoap.HelloWorld(Proy_BibliotecaWeb.ServicioLibros.HelloWorldRequest request) {
            return base.Channel.HelloWorld(request);
        }
        
        public string HelloWorld() {
            Proy_BibliotecaWeb.ServicioLibros.HelloWorldRequest inValue = new Proy_BibliotecaWeb.ServicioLibros.HelloWorldRequest();
            inValue.Body = new Proy_BibliotecaWeb.ServicioLibros.HelloWorldRequestBody();
            Proy_BibliotecaWeb.ServicioLibros.HelloWorldResponse retVal = ((Proy_BibliotecaWeb.ServicioLibros.LibrosSoap)(this)).HelloWorld(inValue);
            return retVal.Body.HelloWorldResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<Proy_BibliotecaWeb.ServicioLibros.HelloWorldResponse> Proy_BibliotecaWeb.ServicioLibros.LibrosSoap.HelloWorldAsync(Proy_BibliotecaWeb.ServicioLibros.HelloWorldRequest request) {
            return base.Channel.HelloWorldAsync(request);
        }
        
        public System.Threading.Tasks.Task<Proy_BibliotecaWeb.ServicioLibros.HelloWorldResponse> HelloWorldAsync() {
            Proy_BibliotecaWeb.ServicioLibros.HelloWorldRequest inValue = new Proy_BibliotecaWeb.ServicioLibros.HelloWorldRequest();
            inValue.Body = new Proy_BibliotecaWeb.ServicioLibros.HelloWorldRequestBody();
            return ((Proy_BibliotecaWeb.ServicioLibros.LibrosSoap)(this)).HelloWorldAsync(inValue);
        }
        
        public void RecuperarLibros() {
            base.Channel.RecuperarLibros();
        }
        
        public System.Threading.Tasks.Task RecuperarLibrosAsync() {
            return base.Channel.RecuperarLibrosAsync();
        }
    }
}
