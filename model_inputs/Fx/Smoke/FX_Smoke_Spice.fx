{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"z": 0.46736,
			"children": [
				{
					"type": "emitter",
					"name": "Smoke_Spice",
					"props": {
						"lifeTime": 6,
						"alignMode": "Screen",
						"instScale_rand": 0.5,
						"maxCount": 100,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"simulationSpace": "World",
						"instStretch_rand": [
							0.1,
							0.1,
							0.1
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"animationSpeed": 0.08,
						"randomColor1": [
							1,
							1,
							1,
							1
						],
						"emitAngle": 0,
						"lifeTimeRand": 1,
						"instSpeed": [
							0.5,
							0,
							2.5
						],
						"instSpeed_rand": [
							0.01,
							0.025,
							0.2
						],
						"instAcceleration": [
							0.5,
							0,
							0
						],
						"instAcceleration_rand": [
							0.1,
							0.1,
							0.2
						],
						"enableSort": false,
						"speedFactor": 0.3,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
						"instScale": 2.3,
						"tag": null
					},
					"scaleX": 0.09999999999999998,
					"scaleY": 0.09999999999999998,
					"scaleZ": 0.1,
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
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false,
											"parallax": 0,
											"textureWrap": true
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Structure/Smoke/white.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 2
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											1,
											1
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "color.h",
											"keys": [
												{
													"time": 0.039999999999999994,
													"value": 0.18479956785822313,
													"mode": 2
												},
												{
													"time": 0.735,
													"value": 0.03333333333333333,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "color.s",
											"keys": [
												{
													"time": 0.039999999999999994,
													"value": 0.4594594594594595,
													"mode": 2
												},
												{
													"time": 0.735,
													"value": 0.016666666666666663,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "color.l",
											"keys": [
												{
													"time": 0.039999999999999994,
													"value": 0.2901960784313725,
													"mode": 2
												},
												{
													"time": 0.735,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.4,
										"saturation": 1,
										"width": 0.77,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 2.2033971051919433e-16,
														"dt": -0.5397630827254113
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.7749999999999999
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.7,
														"dt": -0.14500000000000002
													},
													"nextHandle": {
														"dv": -0.9143298895582741,
														"dt": 0.18939690569421394
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "width",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.021504928795595086,
														"dt": -0.4999895944975692
													},
													"nextHandle": {
														"dv": -0.033333333333333326,
														"dt": 0.7749999999999999
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.2,
										"uvScaleY": 0.2,
										"texture": "Fx/noise/T_Noise_Grunge_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.1614372094585777,
														"dt": -0.537585907497062
													},
													"nextHandle": {
														"dv": -0.16666666666666674,
														"dt": 0.5549999999999999
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.8333333333333333,
														"dt": -0.30000000000000004
													},
													"nextHandle": {
														"dv": -0.7113159996271997,
														"dt": 0.25607375986579195
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "width",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.44516906872488615,
														"dt": -0.4813254700769495
													},
													"nextHandle": {
														"dv": -0.30000000000000004,
														"dt": 0.325048007965088
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.36666666666666664,
														"dt": -0.2694946861267089
													},
													"nextHandle": {
														"dv": -0.36666666666666664,
														"dt": 0.2694946861267089
													}
												}
											]
										}
									]
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.3,
									"topSpan": 0.4,
									"dirIntensity": 0.45,
									"dirSpan": 0.67,
									"sandBlend": 0.7,
									"envBlend": 0.6
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.06,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "instSpeed.z",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": -0.026997755331088613,
									"mode": 0,
									"prevHandle": {
										"dv": -3.804478157639296,
										"dt": -0.1254911758516944
									},
									"nextHandle": {
										"dv": 0.8159708193041526,
										"dt": 0.026899705581763078
									}
								},
								{
									"time": 0.04804712461674793,
									"value": 0.8593153759820427,
									"mode": 0
								},
								{
									"time": 0.7252142857142857,
									"value": 0.15589225589225586,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.24173809523809522
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.24173809523809522
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instSpeed.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 1.8583185031426556e-16,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.14172795189504372
									}
								},
								{
									"time": 0.16999999999999998,
									"value": 1.0066758116140837,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.056666666666666664
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.22999999999999998
									}
								},
								{
									"time": 0.8443367346938775,
									"value": 0.24709315375982055,
									"mode": 0,
									"prevHandle": {
										"dv": -0.09289936401047516,
										"dt": -0.23928571428571432
									},
									"nextHandle": {
										"dv": 0.1080057274948862,
										"dt": 0.28240124663407146
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instSpeed.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.0049999999999999975,
									"value": 1.0333333333333334,
									"mode": 0,
									"prevHandle": {
										"dv": 0.851303742790108,
										"dt": -0.48341891108438234
									},
									"nextHandle": {
										"dv": -0.4666666666666668,
										"dt": 0.265
									}
								},
								{
									"time": 0.9884999999999998,
									"value": 0.1696969696969698,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.3266666666666666
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.3266666666666666
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1.504034788726423,
									"mode": 2
								},
								{
									"time": 1,
									"value": 3,
									"mode": 0,
									"prevHandle": {
										"dv": -0.07237122028132559,
										"dt": -0.5349999999999999
									},
									"nextHandle": {
										"dv": 0.04162030102982175,
										"dt": 0.30767563355153715
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