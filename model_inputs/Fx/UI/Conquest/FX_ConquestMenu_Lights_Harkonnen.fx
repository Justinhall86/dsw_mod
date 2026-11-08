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
					"name": "light_1",
					"x": 0.47232,
					"y": -0.01032,
					"z": 0.01289,
					"scaleX": 6,
					"scaleY": 5.999999999999999,
					"scaleZ": 5.999999999999999,
					"rotationX": 12.7,
					"rotationY": 114.9,
					"rotationZ": 4,
					"kind": "Spot",
					"color": 9938328,
					"power": 0.87,
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
							"keyMode": 0,
							"keys": [
								{
									"time": 1.086806321119169,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 1.708141274957601e-16,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0.0006203322664224409,
										"dt": 0.16411504849114966
									}
								},
								{
									"time": 1.6265624806011725,
									"value": 0.87,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "angle",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0.8320051704924027,
									"value": 14.084050218628525,
									"mode": 0
								},
								{
									"time": 0.8320051704924027,
									"value": 14.084050218628525,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.4569224368108307
									}
								},
								{
									"time": 2.202772480924895,
									"value": 90.25,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.4569224368108307
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.4569224368108307
									}
								}
							]
						}
					]
				},
				{
					"type": "light",
					"name": "light_0",
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
					"color": 11671076,
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
									"time": 0.036470010775811045,
									"value": 0.4,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.4133267887925251
									}
								},
								{
									"time": 0.8971622650849517,
									"value": 1.1,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.4133267887925251
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.4133267887925251
									}
								}
							]
						}
					]
				}
			]
		}
	]
}