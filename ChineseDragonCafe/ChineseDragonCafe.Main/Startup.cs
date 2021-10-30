using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ChineseDragonCafe.Main.Startup))]
namespace ChineseDragonCafe.Main
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
