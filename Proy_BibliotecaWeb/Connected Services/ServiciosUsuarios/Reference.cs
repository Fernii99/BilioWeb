﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.42000
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Proy_BibliotecaWeb.ServiciosUsuarios {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServiciosUsuarios.UsuariosSoap")]
    public interface UsuariosSoap {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/RegistrarUsuario", ReplyAction="*")]
        void RegistrarUsuario();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/RegistrarUsuario", ReplyAction="*")]
        System.Threading.Tasks.Task RegistrarUsuarioAsync();
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface UsuariosSoapChannel : Proy_BibliotecaWeb.ServiciosUsuarios.UsuariosSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class UsuariosSoapClient : System.ServiceModel.ClientBase<Proy_BibliotecaWeb.ServiciosUsuarios.UsuariosSoap>, Proy_BibliotecaWeb.ServiciosUsuarios.UsuariosSoap {
        
        public UsuariosSoapClient() {
        }
        
        public UsuariosSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public UsuariosSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public UsuariosSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public UsuariosSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public void RegistrarUsuario() {
            base.Channel.RegistrarUsuario();
        }
        
        public System.Threading.Tasks.Task RegistrarUsuarioAsync() {
            return base.Channel.RegistrarUsuarioAsync();
        }
    }
}