defmodule Demo.CloudData do
  @moduledoc false

  def summary_metrics do
    %{
      clusters: 12,
      workloads: 186,
      uptime: 99.98,
      monthly_spend: 184_320,
      budget: 220_000,
      risk_score: 84
    }
  end

  def clusters do
    [
      %{
        id: "clu-aurora",
        name: "Aurora",
        region: "us-east-1",
        environment: "production",
        nodes: 12,
        version: "1.28.4",
        status: "Healthy",
        owner: "Platform"
      },
      %{
        id: "clu-borealis",
        name: "Borealis",
        region: "eu-west-1",
        environment: "production",
        nodes: 9,
        version: "1.28.3",
        status: "Healthy",
        owner: "Data"
      },
      %{
        id: "clu-helix",
        name: "Helix",
        region: "us-west-2",
        environment: "staging",
        nodes: 6,
        version: "1.27.9",
        status: "Degraded",
        owner: "Experience"
      },
      %{
        id: "clu-ion",
        name: "Ion",
        region: "ap-southeast-1",
        environment: "production",
        nodes: 8,
        version: "1.28.4",
        status: "Healthy",
        owner: "Edge"
      },
      %{
        id: "clu-kepler",
        name: "Kepler",
        region: "us-central-1",
        environment: "dev",
        nodes: 4,
        version: "1.27.7",
        status: "Maintenance",
        owner: "DevEx"
      }
    ]
  end

  def services do
    [
      %{name: "API Gateway", sla: 99.99, status: "Healthy", latency_ms: 84},
      %{name: "Auth", sla: 99.97, status: "Healthy", latency_ms: 112},
      %{name: "Event Bus", sla: 99.95, status: "Degraded", latency_ms: 240},
      %{name: "Object Storage", sla: 99.98, status: "Healthy", latency_ms: 66},
      %{name: "Observability", sla: 99.92, status: "Healthy", latency_ms: 97}
    ]
  end

  def incidents do
    [
      %{
        id: "inc-1024",
        title: "Event Bus delivery lag",
        severity: "High",
        status: "Investigating",
        owner: "SRE",
        opened_at: "08:12 UTC"
      },
      %{
        id: "inc-1011",
        title: "Staging cluster node churn",
        severity: "Medium",
        status: "Monitoring",
        owner: "Platform",
        opened_at: "06:44 UTC"
      },
      %{
        id: "inc-1003",
        title: "Edge ingress saturation",
        severity: "Low",
        status: "Resolved",
        owner: "Network",
        opened_at: "Yesterday"
      }
    ]
  end

  def policies do
    [
      %{name: "MFA Required", coverage: 98, status: "Passing"},
      %{name: "Encryption at Rest", coverage: 100, status: "Passing"},
      %{name: "Public Storage", coverage: 92, status: "Needs Review"},
      %{name: "Privileged Access", coverage: 87, status: "Needs Review"}
    ]
  end

  def cost_centers do
    [
      %{id: "cc-platform", name: "Platform", month: "Sep", spend: 82_400, change: 4.2},
      %{id: "cc-data", name: "Data", month: "Sep", spend: 46_210, change: -1.4},
      %{id: "cc-edge", name: "Edge", month: "Sep", spend: 32_500, change: 6.8},
      %{id: "cc-experience", name: "Experience", month: "Sep", spend: 23_800, change: 3.1}
    ]
  end

  def audit_events do
    [
      %{id: "evt-9001", actor: "J. Park", action: "Updated firewall policy", time: "09:21"},
      %{id: "evt-9000", actor: "C. Alvarez", action: "Scaled cluster Aurora", time: "08:55"},
      %{id: "evt-8997", actor: "S. Gupta", action: "Rotated API key", time: "08:10"},
      %{id: "evt-8995", actor: "System", action: "Applied OS patching", time: "07:44"}
    ]
  end

  def activity_seed do
    [
      %{
        id: "act-120",
        time: "09:32",
        service: "Event Bus",
        event: "Consumer lag normalized",
        severity: "Info",
        status: "Healthy"
      },
      %{
        id: "act-119",
        time: "09:21",
        service: "Network",
        event: "Firewall policy updated",
        severity: "Low",
        status: "Applied"
      },
      %{
        id: "act-118",
        time: "08:55",
        service: "Clusters",
        event: "Aurora scaled to 12 nodes",
        severity: "Medium",
        status: "Completed"
      }
    ]
  end

  def regions do
    [
      %{id: "us-east-1", label: "US East (N. Virginia)"},
      %{id: "us-west-2", label: "US West (Oregon)"},
      %{id: "eu-west-1", label: "EU West (Ireland)"},
      %{id: "ap-southeast-1", label: "AP Southeast (Singapore)"}
    ]
  end

  def support_plans do
    [
      %{id: "essential", label: "Essential"},
      %{id: "growth", label: "Growth"},
      %{id: "enterprise", label: "Enterprise"}
    ]
  end

  def devices do
    %{
      generated_at: "2026-02-22T12:00:00Z",
      time_zone: "Etc/UTC",
      snapshot_window_minutes: 15,
      devices: [
        %{
          device_id: 2001,
          serial_number: "DEV00101",
          comment: "Site 1 device 1",
          lon: 37.639091,
          lat: 55.762556,
          site_id: 1,
          site_address: "Moscow, Linden Yard",
          site_uin: "MN-ALPHA-001",
          last_bucket: "2026-02-22T11:59:00Z",
          leq_5min: 47.1
        },
        %{
          device_id: 2002,
          serial_number: "DEV00102",
          comment: "Site 1 device 2",
          lon: 37.638181,
          lat: 55.762052,
          site_id: 1,
          site_address: "Moscow, Linden Yard",
          site_uin: "MN-ALPHA-001",
          last_bucket: "2026-02-22T11:46:00Z",
          leq_5min: 42.9
        },
        %{
          device_id: 2003,
          serial_number: "DEV00103",
          comment: "Site 1 device 3",
          lon: 37.637785,
          lat: 55.761997,
          site_id: 1,
          site_address: "Moscow, Linden Yard",
          site_uin: "MN-ALPHA-001",
          last_bucket: "2026-02-22T11:48:00Z",
          leq_5min: 45.3
        },
        %{
          device_id: 2004,
          serial_number: "DEV00201",
          comment: "Site 2 device 1",
          lon: 37.654209,
          lat: 55.736161,
          site_id: 2,
          site_address: "Moscow, Iron Gate",
          site_uin: "MN-BRAVO-014",
          last_bucket: "2026-02-22T11:48:00Z",
          leq_5min: 43.8
        },
        %{
          device_id: 2005,
          serial_number: "DEV00202",
          comment: "Site 2 device 2",
          lon: 37.654008,
          lat: 55.736922,
          site_id: 2,
          site_address: "Moscow, Iron Gate",
          site_uin: "MN-BRAVO-014",
          last_bucket: "2026-02-22T11:48:00Z",
          leq_5min: 62.6
        },
        %{
          device_id: 2006,
          serial_number: "DEV00203",
          comment: "Site 2 device 3",
          lon: 37.653177,
          lat: 55.736327,
          site_id: 2,
          site_address: "Moscow, Iron Gate",
          site_uin: "MN-BRAVO-014",
          last_bucket: "2026-02-22T11:52:00Z",
          leq_5min: 40.6
        },
        %{
          device_id: 2007,
          serial_number: "DEV00301",
          comment: "Site 3 device 1",
          lon: 37.598338,
          lat: 55.774746,
          site_id: 3,
          site_address: "Moscow, Copper Lane",
          site_uin: "MN-CAR-207",
          last_bucket: "2026-02-22T11:52:00Z",
          leq_5min: 47.7
        },
        %{
          device_id: 2008,
          serial_number: "DEV00302",
          comment: "Site 3 device 2",
          lon: 37.598188,
          lat: 55.7735,
          site_id: 3,
          site_address: "Moscow, Copper Lane",
          site_uin: "MN-CAR-207",
          last_bucket: "2026-02-22T11:56:00Z",
          leq_5min: 42.9
        },
        %{
          device_id: 2009,
          serial_number: "DEV00303",
          comment: "Site 3 device 3",
          lon: 37.598853,
          lat: 55.773814,
          site_id: 3,
          site_address: "Moscow, Copper Lane",
          site_uin: "MN-CAR-207",
          last_bucket: nil,
          leq_5min: nil
        },
        %{
          device_id: 2010,
          serial_number: "DEV00401",
          comment: "Site 4 device 1",
          lon: 37.604236,
          lat: 55.72307,
          site_id: 4,
          site_address: "Moscow, Riverbend",
          site_uin: "MN-DELTA-033",
          last_bucket: "2026-02-22T11:48:00Z",
          leq_5min: 41.5
        },
        %{
          device_id: 2011,
          serial_number: "DEV00402",
          comment: "Site 4 device 2",
          lon: 37.605786,
          lat: 55.722976,
          site_id: 4,
          site_address: "Moscow, Riverbend",
          site_uin: "MN-DELTA-033",
          last_bucket: "2026-02-22T11:57:00Z",
          leq_5min: 68.7
        },
        %{
          device_id: 2012,
          serial_number: "DEV00403",
          comment: "Site 4 device 3",
          lon: 37.606421,
          lat: 55.725176,
          site_id: 4,
          site_address: "Moscow, Riverbend",
          site_uin: "MN-DELTA-033",
          last_bucket: "2026-02-22T11:52:00Z",
          leq_5min: 40.4
        },
        %{
          device_id: 2013,
          serial_number: "DEV00501",
          comment: "Site 5 device 1",
          lon: 37.658148,
          lat: 55.787248,
          site_id: 5,
          site_address: "Moscow, Old Market",
          site_uin: "MN-ECHO-118",
          last_bucket: "2026-02-22T11:51:00Z",
          leq_5min: 48.6
        },
        %{
          device_id: 2014,
          serial_number: "DEV00502",
          comment: "Site 5 device 2",
          lon: 37.656366,
          lat: 55.788021,
          site_id: 5,
          site_address: "Moscow, Old Market",
          site_uin: "MN-ECHO-118",
          last_bucket: "2026-02-22T11:57:00Z",
          leq_5min: 44.6
        },
        %{
          device_id: 2015,
          serial_number: "DEV00503",
          comment: "Site 5 device 3",
          lon: 37.65691,
          lat: 55.786683,
          site_id: 5,
          site_address: "Moscow, Old Market",
          site_uin: "MN-ECHO-118",
          last_bucket: "2026-02-22T11:47:00Z",
          leq_5min: 52.8
        },
        %{
          device_id: 2016,
          serial_number: "DEV00601",
          comment: "Site 6 device 1",
          lon: 37.631421,
          lat: 55.711973,
          site_id: 6,
          site_address: "Moscow, Pine District",
          site_uin: "MN-FOXTROT-502",
          last_bucket: "2026-02-22T11:49:00Z",
          leq_5min: 52.3
        },
        %{
          device_id: 2017,
          serial_number: "DEV00602",
          comment: "Site 6 device 2",
          lon: 37.633729,
          lat: 55.71084,
          site_id: 6,
          site_address: "Moscow, Pine District",
          site_uin: "MN-FOXTROT-502",
          last_bucket: "2026-02-22T11:59:00Z",
          leq_5min: 64.7
        },
        %{
          device_id: 2018,
          serial_number: "DEV00603",
          comment: "Site 6 device 3",
          lon: 37.63172,
          lat: 55.711331,
          site_id: 6,
          site_address: "Moscow, Pine District",
          site_uin: "MN-FOXTROT-502",
          last_bucket: nil,
          leq_5min: nil
        },
        %{
          device_id: 2019,
          serial_number: "DEV00701",
          comment: "Site 7 device 1",
          lon: 37.573785,
          lat: 55.769008,
          site_id: 7,
          site_address: "Moscow, Red Arch",
          site_uin: "MN-GOLF-071",
          last_bucket: "2026-02-22T11:53:00Z",
          leq_5min: 47.6
        },
        %{
          device_id: 2020,
          serial_number: "DEV00702",
          comment: "Site 7 device 2",
          lon: 37.572205,
          lat: 55.770933,
          site_id: 7,
          site_address: "Moscow, Red Arch",
          site_uin: "MN-GOLF-071",
          last_bucket: "2026-02-22T11:50:00Z",
          leq_5min: 43.9
        },
        %{
          device_id: 2021,
          serial_number: "DEV00703",
          comment: "Site 7 device 3",
          lon: 37.573159,
          lat: 55.7712,
          site_id: 7,
          site_address: "Moscow, Red Arch",
          site_uin: "MN-GOLF-071",
          last_bucket: "2026-02-22T11:46:00Z",
          leq_5min: 43.9
        },
        %{
          device_id: 2022,
          serial_number: "DEV00801",
          comment: "Site 8 device 1",
          lon: 37.589115,
          lat: 55.730813,
          site_id: 8,
          site_address: "Moscow, Orchard Row",
          site_uin: "MN-HOTEL-440",
          last_bucket: "2026-02-22T11:50:00Z",
          leq_5min: 45.1
        },
        %{
          device_id: 2023,
          serial_number: "DEV00802",
          comment: "Site 8 device 2",
          lon: 37.587794,
          lat: 55.732973,
          site_id: 8,
          site_address: "Moscow, Orchard Row",
          site_uin: "MN-HOTEL-440",
          last_bucket: "2026-02-22T11:50:00Z",
          leq_5min: 59.0
        },
        %{
          device_id: 2024,
          serial_number: "DEV00803",
          comment: "Site 8 device 3",
          lon: 37.589092,
          lat: 55.733138,
          site_id: 8,
          site_address: "Moscow, Orchard Row",
          site_uin: "MN-HOTEL-440",
          last_bucket: "2026-02-22T11:46:00Z",
          leq_5min: 45.5
        }
      ],
      sites: [
        %{
          id: 1,
          uin: "MN-ALPHA-001",
          address: "Moscow, Linden Yard"
        },
        %{
          id: 2,
          uin: "MN-BRAVO-014",
          address: "Moscow, Iron Gate"
        },
        %{
          id: 3,
          uin: "MN-CAR-207",
          address: "Moscow, Copper Lane"
        },
        %{
          id: 4,
          uin: "MN-DELTA-033",
          address: "Moscow, Riverbend"
        },
        %{
          id: 5,
          uin: "MN-ECHO-118",
          address: "Moscow, Old Market"
        },
        %{
          id: 6,
          uin: "MN-FOXTROT-502",
          address: "Moscow, Pine District"
        },
        %{
          id: 7,
          uin: "MN-GOLF-071",
          address: "Moscow, Red Arch"
        },
        %{
          id: 8,
          uin: "MN-HOTEL-440",
          address: "Moscow, Orchard Row"
        }
      ]
    }
  end
end
