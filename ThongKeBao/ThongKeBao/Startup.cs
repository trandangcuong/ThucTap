using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ThongKeBao.Startup))]
namespace ThongKeBao
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
