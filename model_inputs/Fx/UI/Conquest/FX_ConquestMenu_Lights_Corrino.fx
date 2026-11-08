{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "object",
			"name": "Lights",
			"children": [
				{
					"type": "light",
					"name": "light_1 COR",
					"x": 1.98391,
					"y": 1.04525,
					"z": 2.17116,
					"rotationY": 121.8,
					"kind": "Spot",
					"color": 15400441,
					"power": 1.1,
					"occlusionFactor": 0,
					"isMainLight": true,
					"range": 2.39,
					"zNear": 0.02,
					"angle": 90.25,
					"fallOff": 18.31,
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
									"time": 0.5543102392318867,
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
									"value": 1.1,
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
				},
				{
					"type": "light",
					"name": "light_0 COR",
					"x": -0.03992,
					"y": 1.31108,
					"z": 2.97073,
					"scaleX": 2.3000000000000003,
					"scaleY": 1.7917909019821237,
					"scaleZ": 1.7917909019821237,
					"rotationX": 51.6,
					"rotationY": 77.8,
					"rotationZ": 8.3,
					"kind": "Spot",
					"color": 14669252,
					"power": 1.8,
					"range": 2.6,
					"size": 0,
					"zNear": 0.02,
					"angle": 70.45,
					"fallOff": 19.2,
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
									"value": 1.8,
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