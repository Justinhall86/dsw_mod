{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"z": 10,
			"children": [
				{
					"type": "emitter",
					"name": "LensFlare",
					"props": {
						"alignMode": "Screen",
						"instScale_rand": 0,
						"maxCount": 50,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							1,
							1,
							1,
							1
						],
						"randomColor2": [
							0.9215686274509803,
							0.9215686274509803,
							0.9215686274509803,
							0.8509803921568627
						],
						"emitAngle": 0,
						"emitRate": 1,
						"instRotation_rand": [
							0,
							0,
							0
						],
						"instScale": 17,
						"emitType": "Burst",
						"burstDelay": 0.12,
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"instStretch_rand": [
							0,
							0,
							0
						],
						"warmUpTime": -0.62,
						"lifeTime": 1.6,
						"instOffset": [
							0,
							1,
							0
						],
						"instRotation": [
							0,
							0,
							-30
						]
					},
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"rotationX": 70,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
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
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": true,
											"parallax": 0,
											"textureWrap": true,
											"emissive": 10
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Structure/Smoke/white.png",
									"color": [
										1,
										0.5176470588235293,
										0.396078431372549,
										1
									]
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.47058823529411764,
											0.2901960784313725,
											0.18823529411764706
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_LensFlare_01.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.0049999999999999975,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.2619278819653144,
														"dt": -0.3266166282733753
													},
													"nextHandle": {
														"dv": -0.85,
														"dt": 0.22000000000000003
													}
												},
												{
													"time": 1,
													"value": 0.033333333333333326,
													"mode": 2
												}
											]
										}
									],
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 1
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "fakeLight",
									"props": {},
									"envBlend": 0.7
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"keys": [
								{
									"time": 0,
									"value": 1.0666666666666667,
									"mode": 2
								},
								{
									"time": 1,
									"value": 1.1,
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