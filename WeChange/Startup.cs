using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WeChange.Startup))]
namespace WeChange
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
