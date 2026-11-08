{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "object",
			"name": "LIGHTING",
			"x": 1.65964,
			"y": 1.069105,
			"z": 2.7233650000000003,
			"children": [
				{
					"type": "light",
					"name": "light_0 ECAZ",
					"x": 0.49895,
					"y": -0.01499,
					"z": 0.00071,
					"scaleX": 6,
					"scaleY": 5.999999999999999,
					"scaleZ": 5.999999999999999,
					"rotationX": 12.7,
					"rotationY": 114.9,
					"rotationZ": 4,
					"kind": "Spot",
					"color": 11775915,
					"power": 0.89,
					"occlusionFactor": 0,
					"isMainLight": true,
					"range": 5,
					"zNear": 0.02,
					"angle": 46,
					"fallOff": 20,
					"debugDisplay": false,
					"shadows": {
						"mode": "Dynamic",
						"size": 4096,
						"radius": 0,
						"quality": 1,
						"bias": 0.01,
						"samplingMode": {
							"kind": "PCF",
							"quality": 2,
							"scale": 1,
							"bias": 0.1
						}
					},
					"children": [
						{
							"type": "curve",
							"name": "power",
							"keys": [
								{
									"time": 1.044891926039156,
									"value": 0,
									"mode": 2
								},
								{
									"time": 3.0149616842912614,
									"value": 1,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "light",
					"name": "light_2 ECAZ",
					"x": -0.5388599999999999,
					"y": 0.032424999999999926,
					"z": 0.12750499999999976,
					"scaleX": 6.9,
					"scaleY": 11.951150572225249,
					"scaleZ": 11.951150572225249,
					"rotationX": -33.00000000000001,
					"rotationY": 86.2,
					"rotationZ": -124.6,
					"kind": "Spot",
					"color": 11442835,
					"power": 1.5,
					"range": 6.9,
					"size": 0,
					"zNear": 0.02,
					"angle": 120,
					"fallOff": 24.6,
					"children": [
						{
							"type": "curve",
							"name": "power",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.37737895590614234,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 2.3687138573894666e-16,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.8099810421080869
									}
								},
								{
									"time": 1.7619146889870685,
									"value": 1.3,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "angle",
							"keys": [
								{
									"time": 0.5939038277484501,
									"value": 14.084050218628525,
									"mode": 2
								},
								{
									"time": 2.202772480924895,
									"value": 90.25,
									"mode": 2
								}
							]
						}
					]
				}
			]
		}
	]
}