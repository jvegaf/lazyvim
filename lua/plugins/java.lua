return {
  {
    'nvim-java/nvim-java',
    config = false,
    dependencies = {
      {
        'neovim/nvim-lspconfig',
        opts = {
          servers = {
            -- Your JDTLS configuration goes here

            jdtls = {
              -- 1. Forzar a jdtls a usar tu JDK para compilar el proyecto
              settings = {
                java = {
                  configuration = {
                    runtimes = {
                      {
                        name = 'JavaSE-26',
                        -- os.getenv captura tu $JAVA_HOME de la terminal
                        path = vim.fn.getenv('JAVA_HOME'),
                        default = true,
                      },
                    },
                  },
                  annotationProcessing = {
                    enabled = true,
                  },
                },
              },
              -- 2. Forzar al script de Mason a levantar jdtls usando tu binario de Java 26
              cmd = {
                vim.fn.getenv('JAVA_HOME') .. '/bin/java', -- Usa el ejecutable de tu JAVA_HOME
                '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                '-Dosgi.bundles.defaultStartLevel=4',
                '-Declipse.product=org.eclipse.jdt.ls.core.product',
                '-Dlog.level=ALL',
                '-Xmx1G',
                '--add-modules=ALL-SYSTEM',
                '--add-opens',
                'java.base/java.util=ALL-UNNAMED',
                '--add-opens',
                'java.lang=ALL-UNNAMED',
              },
            },
          },
          setup = {
            jdtls = function()
              -- Your nvim-java configuration goes here
              require('java').setup({
                root_markers = {
                  'settings.gradle',
                  'settings.gradle.kts',
                  'pom.xml',
                  'build.gradle',
                  'mvnw',
                  'gradlew',
                  'build.gradle',
                  'build.gradle.kts',
                  '.git',
                },
                lombok = {
                  version = 'nightly',
                },
                spring_boot_tools = {
                  enable = true,
                },
                java_debug_adapter = {
                  enable = true,
                },
                java_test = {
                  enable = true,
                },
                jdk = {
                  auto_install = false,
                },
                notifications = {
                  dap = false,
                },
                verification = {
                  invalid_order = true,
                },
              })
            end,
          },
        },
      },
    },
  },
  {
    'artur-shaik/jc.nvim',
    ft = { 'java' },
    dependencies = {
      'nvim-java/nvim-java',
    },
    opts = {
      keys_prefix = "'j",
    },
  },
}
