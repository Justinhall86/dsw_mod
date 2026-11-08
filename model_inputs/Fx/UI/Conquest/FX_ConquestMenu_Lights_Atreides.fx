{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "object",
			"name": "LIGHTING",
			"x": 1.915505,
			"y": 0.89838,
			"z": 2.585125,
			"children": [
				{
					"type": "light",
					"name": "light_0 ATR_0",
					"x": 0.12214500000000017,
					"y": 0.14687000000000006,
					"z": -0.44728499999999993,
					"scaleX": 6.130000000000001,
					"scaleY": 6.156805694268284,
					"scaleZ": 6.156805694268283,
					"rotationX": -90.00000000000001,
					"rotationY": 131.79999999999998,
					"kind": "Spot",
					"color": 16774613,
					"power": 0.83,
					"occlusionFactor": 0,
					"isMainLight": true,
					"range": 6.13,
					"zNear": 0.02,
					"angle": 90.25,
					"fallOff": 22,
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
									"value": 0.83,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "angle",
							"keys": [
								{
									"time": 0.5359015857176509,
									"value": 14.084050218628525,
									"mode": 2
								},
								{
									"time": 1.6272837968155978,
									"value": 90.25,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "light",
					"name": "light_1 ATR_0",
					"x": -0.23163,
					"y": -0.18978,
					"z": -0.0157,
					"scaleX": 2.7499999999999996,
					"scaleY": 2.1485354728934727,
					"scaleZ": 2.1485354728934722,
					"rotationX": -30.499999999999975,
					"rotationY": 111.50000000000001,
					"rotationZ": -49.999999999999964,
					"kind": "Spot",
					"color": 7912302,
					"power": 1.2,
					"range": 4.31,
					"size": 0,
					"zNear": 0.02,
					"fallOff": 19.2,
					"children": [
						{
							"type": "curve",
							"name": "power",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.032570063704442605,
									"value": 0.1,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.6130336666067452
									}
								},
								{
									"time": 1.9960613475975526,
									"value": 1.2,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.6130336666067452
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.6130336666067452
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