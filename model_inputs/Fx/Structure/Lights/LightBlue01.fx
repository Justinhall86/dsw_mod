{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "lookAt",
					"name": "lookAt - locked",
					"scaleX": 0.4,
					"scaleY": 0.4,
					"scaleZ": 0.4,
					"rotationY": -21.675607205345617,
					"target": "camera",
					"lockAxis": [
						0,
						1,
						0
					],
					"children": [
						{
							"type": "polygon",
							"name": "middle hexagony",
							"x": 0.05,
							"z": 5.551115123125783e-17,
							"scaleX": 0.5,
							"scaleY": 0.4,
							"rotationX": -90.00000000000001,
							"rotationZ": -90.00000000000004,
							"kind": 0,
							"args": [
								0
							],
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"emissive": 0.5
										}
									},
									"diffuseMap": "Fx/Structure/Lights/T_Hexagon02.png",
									"color": [
										0.2549019607843137,
										0.9333333333333333,
										1,
										1
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.105,
											"value": 0.9142881944444438,
											"mode": 2
										},
										{
											"time": 0.21000000000000002,
											"value": 1.0857638888888883,
											"mode": 2
										},
										{
											"time": 0.32,
											"value": 0.9081423611111107,
											"mode": 2
										},
										{
											"time": 0.5549999999999999,
											"value": 1.0565972222222217,
											"mode": 2
										},
										{
											"time": 0.725,
											"value": 0.9257465277777771,
											"mode": 2
										},
										{
											"time": 0.875,
											"value": 1.0857638888888883,
											"mode": 2
										},
										{
											"time": 1.0599999999999998,
											"value": 0.9424131944444438,
											"mode": 2
										},
										{
											"time": 1.2049999999999998,
											"value": 1.061805555555555,
											"mode": 2
										},
										{
											"time": 1.4099999999999997,
											"value": 0.9194965277777771,
											"mode": 2
										},
										{
											"time": 1.655,
											"value": 1.099305555555555,
											"mode": 2
										},
										{
											"time": 1.8049999999999997,
											"value": 0.9267881944444438,
											"mode": 2
										},
										{
											"time": 1.9,
											"value": 1.0628472222222216,
											"mode": 2
										},
										{
											"time": 2,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "shader",
					"name": "DepthBlend",
					"source": "shaders/DepthBlend.hx",
					"props": {
						"REVERSE": false,
						"range": 0.1,
						"power": 3
					},
					"isInstance": true
				}
			]
		}
	]
}