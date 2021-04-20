defmodule QMI.MixProject do
  use Mix.Project

  @version "0.2.0"
  @source_url "https://github.com/smartrent/qmi"

  def project do
    [
      app: :qmi,
      version: @version,
      description: description(),
      package: package(),
      source_url: @source_url,
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      compilers: [:elixir_make | Mix.compilers()],
      make_targets: ["all"],
      make_clean: ["clean"],
      deps: deps(),
      dialyzer: [
        flags: [:unmatched_returns, :error_handling, :race_conditions, :underspecs]
      ],
      docs: docs(),
      package: package(),
      preferred_cli_env: [
        docs: :docs,
        "hex.build": :docs,
        "hex.publish": :docs
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    "QMI!"
  end

  defp deps do
    [
      {:dialyxir, "~> 1.1.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.22", only: :docs, runtime: false},
      {:elixir_make, "~> 0.6", runtime: false},
      {:credo, "~> 1.2", only: [:dev, :test], runtime: false}
    ]
  end

  def docs do
    [
      assets: "assets",
      extras: [
        "README.md",
        "CHANGELOG.md"
      ],
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @source_url,
      skip_undefined_reference_warnings_on: ["CHANGELOG.md"],
      groups_for_modules: [
        Services: [
          QMI.Control,
          QMI.NetworkAccess,
          QMI.WirelessData
        ],
        Codec: [
          QMI.Codec.Control,
          QMI.Codec.NetworkAccess,
          QMI.Codec.WirelessData
        ]
      ]
    ]
  end

  def package do
    [
      licenses: ["Proprietary"],
      links: %{"GitHub" => @source_url},
      files: [
        "lib",
        "src",
        "CHANGELOG.md",
        "LICENSE",
        "mix.exs",
        "README.md",
        "Makefile"
      ],
      organization: "smartrent"
    ]
  end
end
