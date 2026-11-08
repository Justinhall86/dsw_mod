{
	"type": "fx",
	"duration": 25,
	"cullingRadius": 15,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Altar",
					"source": "Vehicle/Fremen/Altar/Altar.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Altar/Anim_Altar_Death.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Explosion",
					"y": 0.47626,
					"z": -0.77218,
					"children": [
						{
							"type": "model",
							"name": "GridFlames",
							"source": "Fx/Meshes_Common/Altar_Balloon02.fbx",
							"y": -2.60068,
							"z": 0.78928,
							"rotationX": -90,
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
											"colorMask": 255,
											"emissive": 2
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/noise/T_Embers04.png",
									"normalMap": "Fx/DistortionMaps/psfixnormal.jpg",
									"specularMap": "Fx/Gradients/z_FillGrey50.jpg"
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -7198190
													},
													{
														"position": 0.4375,
														"color": -37888
													},
													{
														"position": 1,
														"color": -10240
													}
												],
												"resolution": 64,
												"isVertical": false
											}
										}
									}
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": true,
										"ALPHA": false,
										"REVERSE": false,
										"bias": 0.15,
										"scale": 0.76,
										"power": 1,
										"color": [
											1,
											0.5176470588235293,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.89,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 6,
										"texture": "Fx/noise/T_Noise_Water_05.png",
										"uvShift": [
											-0.1,
											0
										],
										"uvShiftSpeed": [
											-0.9,
											0.1
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 4.8069756824735705,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 7.9669357650467365,
													"value": 0.89,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.18500000000000005
													},
													"nextHandle": {
														"dv": 0.06003813632869936,
														"dt": 0.3332116566242845
													}
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
										"progress": 0.34,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/clouds_Dissolve.png",
										"uvShift": [
											-0.1,
											0
										],
										"uvShiftSpeed": [
											-0.75,
											0.5
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 4.8069756824735705,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 7.9669357650467365,
													"value": 0.89,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.18500000000000005
													},
													"nextHandle": {
														"dv": 0.06003813632869936,
														"dt": 0.3332116566242845
													}
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
										"progress": 0.89,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Alphas/T_AltarGrid03-2.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "Level",
									"source": "shaders/Level.hx",
									"props": {
										"levelMin": 0.15,
										"levelMax": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "levelMin",
											"loop": true,
											"keys": [
												{
													"time": -0.010000000000000002,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.11000000000000004,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 0.21500000000000005,
													"value": 0.3746893466403401,
													"mode": 2
												},
												{
													"time": 0.3600000000000001,
													"value": 0.8423825583950751,
													"mode": 2
												},
												{
													"time": 0.4900000000000001,
													"value": 0.6962284297217205,
													"mode": 2
												},
												{
													"time": 0.5900000000000002,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 0.7300000000000002,
													"value": 0.21391980509964992,
													"mode": 2
												},
												{
													"time": 0.8800000000000002,
													"value": 0.9008442098644169,
													"mode": 2
												},
												{
													"time": 0.9950000000000003,
													"value": 0.5354588881810303,
													"mode": 2
												},
												{
													"time": 1.0900000000000003,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 1.1800000000000004,
													"value": -0.034542213645053055,
													"mode": 2
												},
												{
													"time": 1.2800000000000002,
													"value": 0.5500743010483657,
													"mode": 2
												},
												{
													"time": 1.4100000000000004,
													"value": 0.12622732789563712,
													"mode": 2
												},
												{
													"time": 1.5350000000000004,
													"value": 0.710843842589056,
													"mode": 2
												},
												{
													"time": 1.6050000000000004,
													"value": 0.25776604370165634,
													"mode": 2
												},
												{
													"time": 1.7950000000000004,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 1.8800000000000006,
													"value": -0.04915762651238853,
													"mode": 2
												},
												{
													"time": 2.085000000000001,
													"value": 0.5939205396503722,
													"mode": 2
												},
												{
													"time": 2.290000000000001,
													"value": 0.12622732789563712,
													"mode": 2
												},
												{
													"time": 2.540000000000001,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 2.615000000000001,
													"value": 0.2285352179669854,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "levelMax",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": -0.025000000000000005,
													"value": 0.85,
													"mode": 2
												},
												{
													"time": 0.11000000000000004,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 0.20000000000000004,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 0.3600000000000001,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4900000000000001,
													"value": 0.87,
													"mode": 2
												},
												{
													"time": 0.5900000000000002,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 0.7150000000000002,
													"value": 0.98,
													"mode": 2
												},
												{
													"time": 0.8800000000000002,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9950000000000003,
													"value": 0.86,
													"mode": 2
												},
												{
													"time": 1.0900000000000003,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 1.1650000000000007,
													"value": 0.95,
													"mode": 2
												},
												{
													"time": 1.2800000000000002,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3950000000000007,
													"value": 0.91,
													"mode": 2
												},
												{
													"time": 1.5350000000000004,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5900000000000007,
													"value": 0.87,
													"mode": 2
												},
												{
													"time": 1.7950000000000004,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 1.8650000000000009,
													"value": 0.865,
													"mode": 2
												},
												{
													"time": 2.085000000000001,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.2750000000000012,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 2.540000000000001,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 2.6000000000000014,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "levelMax",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": -0.025000000000000005,
													"value": 0.85,
													"mode": 2
												},
												{
													"time": 0.02500000000000001,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 0.08000000000000002,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 0.23500000000000007,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4900000000000001,
													"value": 0.87,
													"mode": 2
												},
												{
													"time": 0.5900000000000002,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 0.7150000000000002,
													"value": 0.98,
													"mode": 2
												},
												{
													"time": 0.8800000000000002,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9950000000000003,
													"value": 0.86,
													"mode": 2
												},
												{
													"time": 1.0900000000000003,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 1.1650000000000007,
													"value": 0.95,
													"mode": 2
												},
												{
													"time": 1.3900000000000003,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4550000000000003,
													"value": 0.91,
													"mode": 2
												},
												{
													"time": 1.5900000000000005,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.6550000000000005,
													"value": 0.87,
													"mode": 2
												},
												{
													"time": 1.7950000000000004,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 1.9950000000000003,
													"value": 0.865,
													"mode": 2
												},
												{
													"time": 2.190000000000001,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.3450000000000006,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 2.540000000000001,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 2.6000000000000014,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "levelMax",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.44000000000000017,
													"value": 0.87,
													"mode": 2
												},
												{
													"time": 0.7850000000000001,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.1650000000000007,
													"value": 0.95,
													"mode": 2
												},
												{
													"time": 2.190000000000001,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.3450000000000006,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 2.615,
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
							"type": "light",
							"name": "light_0",
							"y": 0.55556,
							"color": 16731648,
							"power": 0.5,
							"range": 20,
							"size": 4.5,
							"zNear": 0.02,
							"children": [
								{
									"type": "curve",
									"name": "power",
									"loop": true,
									"keys": [
										{
											"time": 0.006311172114292296,
											"value": 0.351777924768865,
											"mode": 2
										},
										{
											"time": 0.13876695977298364,
											"value": 0.372455664863352,
											"mode": 2
										},
										{
											"time": 0.2767506252392927,
											"value": 0.14357098861665274,
											"mode": 2
										},
										{
											"time": 0.41201429711429255,
											"value": 0.34012971950260223,
											"mode": 2
										},
										{
											"time": 0.5322486721142928,
											"value": 0.23420587864885994,
											"mode": 2
										},
										{
											"time": 0.6575769697293437,
											"value": 0.4586922004582109,
											"mode": 2
										},
										{
											"time": 0.7549537502392927,
											"value": 0.22341816344134915,
											"mode": 2
										},
										{
											"time": 0.9263111721142934,
											"value": 0.3208708393473764,
											"mode": 2
										},
										{
											"time": 1.0239380966290648,
											"value": 0.061523202136482616,
											"mode": 2
										},
										{
											"time": 1.108964626656455,
											"value": 0.2130198589753995,
											"mode": 2
										},
										{
											"time": 1.1753443752392954,
											"value": 0.17736524433948572,
											"mode": 2
										},
										{
											"time": 1.3227558870777312,
											"value": 0.3419945393232184,
											"mode": 2
										},
										{
											"time": 1.462483047114295,
											"value": 0.27068531005138996,
											"mode": 2
										},
										{
											"time": 1.5384205471142953,
											"value": 0.31971040517577237,
											"mode": 2
										},
										{
											"time": 1.6270142971142958,
											"value": 0.22457643857124707,
											"mode": 2
										},
										{
											"time": 1.7852174221142958,
											"value": 0.3112413992697636,
											"mode": 2
										},
										{
											"time": 1.896938358412664,
											"value": 0.1386350669978238,
											"mode": 2
										},
										{
											"time": 2.0963111721142926,
											"value": 0.28235307903692397,
											"mode": 2
										},
										{
											"time": 2.2999537502392924,
											"value": 0.23304760351896206,
											"mode": 2
										},
										{
											"time": 2.5411014972790875,
											"value": 0.391564576496333,
											"mode": 2
										},
										{
											"time": 2.6399537502392922,
											"value": 0.1945298432085105,
											"mode": 2
										},
										{
											"time": 2.7004225002392968,
											"value": 0.23304760351896206,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keys": [
										{
											"time": 0.014432537890970737,
											"value": 10,
											"mode": 2
										},
										{
											"time": 5.149727544066094,
											"value": 10,
											"mode": 2
										},
										{
											"time": 6.881001372163615,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "GasLeak",
							"props": {
								"lifeTime": 1.25,
								"alignMode": "Screen",
								"instScale_rand": 0.5,
								"maxCount": 50,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"instStretch_rand": [
									0.1,
									0.1,
									0.1
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"emitAngle": 10.91,
								"instSpeed": [
									12,
									0,
									0
								],
								"instSpeed_rand": [
									4,
									0,
									0
								],
								"enableSort": false,
								"instScale": 2.5,
								"seedGroup": 2,
								"tag": null,
								"burstParticleCount": 5,
								"lifeTimeRand": 0.5,
								"emitShape": "Cone",
								"burstCount": 2,
								"burstDelay": 1.75,
								"emitRate": 8
							},
							"x": -1.16846,
							"y": 0.53934,
							"z": -1.66494,
							"rotationX": 10.7,
							"rotationY": 15.3,
							"rotationZ": 135,
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
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/TS_Dust_01_1024.png"
											}
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
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.9049999999999999,
															"value": 1.172861257340189,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.9049999999999999,
															"value": 0.11627906976744184,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9049999999999999,
															"value": 0.5784313725490196,
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
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/Wave_02.jpg.png",
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
											"sandBlend": 0.4,
											"envBlend": 0.3
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.0313895804049744,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.6699999999999999
															},
															"nextHandle": {
																"dv": -2.5581510915522486e-16,
																"dt": 0.3133333333333333
															}
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
												"range": 1,
												"power": 0.8
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
											"value": 1,
											"mode": 0
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.026997755331088613,
												"dt": -0.7749999999999999
											},
											"nextHandle": {
												"dv": 0.012705940615832523,
												"dt": 0.3333055879251503
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
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -2.1965602144892507,
												"dt": -0.34055197123864367
											},
											"nextHandle": {
												"dv": 1.29,
												"dt": 0.2
											}
										},
										{
											"time": 1,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.71
											},
											"nextHandle": {
												"dv": -4.522676762219434e-16,
												"dt": 0.3077538196705844
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keys": [
										{
											"time": 1.7983190917968763,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7983190917968763,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.8223461914062513,
											"value": 1,
											"mode": 0
										},
										{
											"time": 1.8223461914062513,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.003333333333333332
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.003333333333333332
											}
										},
										{
											"time": 2.6100000000000003,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.6100000000000003,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.0700000000000003,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.0700000000000003,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "GasLeak_Flames",
							"props": {
								"alignMode": "Screen",
								"instScale_rand": 0.5,
								"maxCount": 50,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"instStretch_rand": [
									0.1,
									0.1,
									0.1
								],
								"frameCount": 32,
								"frameDivisionX": 8,
								"frameDivisionY": 8,
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"emitAngle": 10.91,
								"instSpeed": [
									4,
									0,
									0
								],
								"instSpeed_rand": [
									2,
									0,
									0
								],
								"enableSort": false,
								"instScale": 2,
								"seedGroup": 2,
								"tag": null,
								"burstParticleCount": 5,
								"lifeTimeRand": 0.5,
								"emitShape": "Cone",
								"burstCount": 2,
								"burstDelay": 1.75,
								"emitRate": 8,
								"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png"
							},
							"x": -0.77365,
							"y": 0.14453,
							"z": -1.51219,
							"rotationX": 10.7,
							"rotationY": 15.3,
							"rotationZ": 135,
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
												"scale": 1
											},
											"isInstance": true
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
													"keyMode": 0,
													"keys": [
														{
															"time": -0.0050000000000000044,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.039999999999999994,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.002592191728735997,
																"dt": -0.03499458833793611
															},
															"nextHandle": {
																"dv": -0.06666666666666665,
																"dt": 0.8999999999999999
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.45098039215686275,
													0.2901960784313725
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Noise_Wave_02.png",
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
																"dv": 0.4501476276915423,
																"dt": -0.6144515117989549
															},
															"nextHandle": {
																"dv": -0.33333333333333337,
																"dt": 0.455
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.2833333333333333,
																"dt": -0.29500000000000004
															},
															"nextHandle": {
																"dv": -0.40250763363430087,
																"dt": 0.41908147737218393
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "width",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0520769766684747,
																"dt": -0.49993897601734766
															},
															"nextHandle": {
																"dv": -0.06666666666666665,
																"dt": 0.6399999999999999
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.1965602144892507,
												"dt": -0.34055197123864367
											},
											"nextHandle": {
												"dv": 1.29,
												"dt": 0.2
											}
										},
										{
											"time": 1,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.71
											},
											"nextHandle": {
												"dv": -4.522676762219434e-16,
												"dt": 0.3077538196705844
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keys": [
										{
											"time": 2.0139646866923906,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.0139646866923906,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.037991786301766,
											"value": 3,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.003333333333333332
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.003333333333333332
											}
										},
										{
											"time": 3.219760399460795,
											"value": 3,
											"mode": 2
										},
										{
											"time": 3.229760399460795,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "GasLeak_Smoke",
							"props": {
								"alignMode": "Screen",
								"instScale_rand": 0.5,
								"maxCount": 70,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"instStretch_rand": [
									0.1,
									0.1,
									0.1
								],
								"frameCount": 32,
								"frameDivisionX": 8,
								"frameDivisionY": 8,
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"instSpeed": [
									3,
									0,
									0
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"enableSort": false,
								"instScale": 2.25,
								"seedGroup": 2,
								"tag": null,
								"burstParticleCount": 5,
								"lifeTimeRand": 0.5,
								"emitShape": "Cone",
								"burstCount": 2,
								"burstDelay": 1.75,
								"emitRate": 3,
								"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
								"lifeTime": 8,
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instWorldAcceleration": [
									0,
									0,
									3.5
								],
								"instWorldAcceleration_rand": [
									0,
									0,
									1
								]
							},
							"x": -0.64215,
							"y": 0.36057,
							"z": -0.72793,
							"rotationX": 10.7,
							"rotationY": 15.3,
							"rotationZ": 135,
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
													"keyMode": 0,
													"keys": [
														{
															"time": -0.0050000000000000044,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.039999999999999994,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.029812589848475162,
																"dt": -0.03384131820637717
															},
															"nextHandle": {
																"dv": -0.6166666666666667,
																"dt": 0.7
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.2392156862745098,
													0.2392156862745098,
													0.2392156862745098
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 0.1,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0.1,
												"width": 1,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/causticTexture_03-2-Blured.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.05,
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
																"dv": 0.17597127610376737,
																"dt": -0.6268976711196711
															},
															"nextHandle": {
																"dv": -0.1333333333333333,
																"dt": 0.47500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.009090909090909038,
																"dt": -0.4642857142857143
															},
															"nextHandle": {
																"dv": 0.008539703073546545,
																"dt": 0.4361348355418391
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "width",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0520769766684747,
																"dt": -0.49993897601734766
															},
															"nextHandle": {
																"dv": -0.06666666666666665,
																"dt": 0.6399999999999999
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
											"envBlend": 0.1
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1.2,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instWorldAcceleration.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.6411458333333333,
												"dt": -0.5838735693730812
											},
											"nextHandle": {
												"dv": -0.4822519706918829,
												"dt": 0.43472037092187554
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
											"value": 1,
											"mode": 0
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.026997755331088613,
												"dt": -0.7749999999999999
											},
											"nextHandle": {
												"dv": 0.012705940615832523,
												"dt": 0.3333055879251503
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -2.1965602144892507,
												"dt": -0.34055197123864367
											},
											"nextHandle": {
												"dv": 1.29,
												"dt": 0.2
											}
										},
										{
											"time": 1,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.71
											},
											"nextHandle": {
												"dv": -4.522676762219434e-16,
												"dt": 0.3077538196705844
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -2.1965602144892507,
												"dt": -0.34055197123864367
											},
											"nextHandle": {
												"dv": 1.29,
												"dt": 0.2
											}
										},
										{
											"time": 1,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.71
											},
											"nextHandle": {
												"dv": -4.522676762219434e-16,
												"dt": 0.3077538196705844
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 0,
									"keys": [
										{
											"time": 3.5661413088440916,
											"value": 0,
											"mode": 2
										},
										{
											"time": 4.117784979343418,
											"value": 3,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.003333333333333332
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.003333333333333332
											}
										},
										{
											"time": 15.95553769781125,
											"value": 3,
											"mode": 2
										},
										{
											"time": 20,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -3.148129325580566
											},
											"nextHandle": {
												"dv": -3.131337907245019e-16,
												"dt": 1.3481541007295832
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.012707392165911546,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.05166666666666666
											}
										},
										{
											"time": 0.05499999999999999,
											"value": -0.509348731270885,
											"mode": 0,
											"prevHandle": {
												"dv": -0.6178478332448459,
												"dt": -0.024810868515554432
											},
											"nextHandle": {
												"dv": 0.8715807006116155,
												"dt": 0.03500000000000003
											}
										},
										{
											"time": 0.09499999999999999,
											"value": 0.3300049349567332,
											"mode": 0,
											"prevHandle": {
												"dv": -0.09186223587130012,
												"dt": -0.05987522403665296
											},
											"nextHandle": {
												"dv": 0.636704555180494,
												"dt": 0.4140681559183458
											}
										},
										{
											"time": 1,
											"value": 1.01469963255798,
											"mode": 0,
											"prevHandle": {
												"dv": -0.1819155871944269,
												"dt": -0.38
											},
											"nextHandle": {
												"dv": 0.12673911289324527,
												"dt": 0.2647429153388605
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "color.a",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 10.419363430525415,
											"value": 1,
											"mode": 2
										},
										{
											"time": 18.356590879257,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -2.645742482910528
											},
											"nextHandle": {
												"dv": 0,
												"dt": 2.645742482910528
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "InsideFlames",
							"props": {
								"alignMode": "Screen",
								"instScale_rand": 0.5,
								"maxCount": 50,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"instStretch_rand": [
									0.1,
									0.1,
									0.1
								],
								"frameCount": 32,
								"frameDivisionX": 8,
								"frameDivisionY": 8,
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"emitAngle": 10.91,
								"instSpeed": [
									0.4,
									0.4,
									0.4
								],
								"instSpeed_rand": [
									0.1,
									0.1,
									0.1
								],
								"enableSort": false,
								"instScale": 1.4,
								"seedGroup": 2,
								"tag": null,
								"burstParticleCount": 5,
								"lifeTimeRand": 0.2,
								"burstCount": 2,
								"burstDelay": 1.75,
								"emitRate": 12,
								"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
								"lifeTime": 0.5
							},
							"x": -0.30199,
							"y": 0.32803,
							"z": -0.37856,
							"scaleX": 2,
							"scaleY": 0.25,
							"scaleZ": 2.67,
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
												"scale": 1
											},
											"isInstance": true
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
													"keyMode": 0,
													"keys": [
														{
															"time": -0.0050000000000000044,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.039999999999999994,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.002592191728735997,
																"dt": -0.03499458833793611
															},
															"nextHandle": {
																"dv": -0.06666666666666665,
																"dt": 0.8999999999999999
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.45098039215686275,
													0.2901960784313725
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Noise_Wave_02.png",
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
																"dv": 0.4501476276915423,
																"dt": -0.6144515117989549
															},
															"nextHandle": {
																"dv": -0.33333333333333337,
																"dt": 0.455
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.2833333333333333,
																"dt": -0.29500000000000004
															},
															"nextHandle": {
																"dv": -0.40250763363430087,
																"dt": 0.41908147737218393
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "width",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0520769766684747,
																"dt": -0.49993897601734766
															},
															"nextHandle": {
																"dv": -0.06666666666666665,
																"dt": 0.6399999999999999
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
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -2.1965602144892507,
												"dt": -0.34055197123864367
											},
											"nextHandle": {
												"dv": 1.29,
												"dt": 0.2
											}
										},
										{
											"time": 1,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.71
											},
											"nextHandle": {
												"dv": -4.522676762219434e-16,
												"dt": 0.3077538196705844
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keys": [
										{
											"time": 2.8852235412597658,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.8852235412597658,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.909250640869141,
											"value": 3,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.003333333333333332
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.003333333333333332
											}
										},
										{
											"time": 3.7776998418569567,
											"value": 3,
											"mode": 2
										},
										{
											"time": 4.826073653578491,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Explo1",
							"x": -0.19428,
							"y": 0.06695,
							"z": -2.04945,
							"children": [
								{
									"type": "subFX",
									"name": "FX_Explosion_Mid_Local",
									"source": "Fx/Explosion/FX_Explosion_Mid_Local_Photosensitive.fx",
									"x": -1.4071566666666668,
									"y": -0.2641533333333337,
									"z": -0.0743500000000008,
									"scaleX": 0.30000000000000004,
									"scaleY": 0.3,
									"scaleZ": 0.3,
									"time": -0.2
								},
								{
									"type": "subFX",
									"name": "FX_Explosion_Mid_Local",
									"source": "Fx/Explosion/FX_Explosion_Mid_Photosensitive.fx",
									"x": 0.07316333333333325,
									"y": 0.3226966666666664,
									"z": -0.3736600000000001,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.5,
									"time": -0.2
								},
								{
									"type": "subFX",
									"name": "FX_Explosion_Mid_Local",
									"source": "Fx/Explosion/FX_Explosion_Mid_Local_Photosensitive.fx",
									"x": 0.016633333333333278,
									"y": 0.5286666666666662,
									"z": 0.04763999999999924,
									"scaleX": 0.25,
									"scaleY": 0.25,
									"scaleZ": 0.25,
									"time": -0.2
								},
								{
									"type": "subFX",
									"name": "FX_Explosion_Mid_Local",
									"source": "Fx/Explosion/FX_Explosion_Mid_Local_Photosensitive.fx",
									"x": 1.6099033333333335,
									"y": 0.5286666666666653,
									"z": 0.28437999999999963,
									"scaleX": 0.25,
									"scaleY": 0.24999999999999994,
									"scaleZ": 0.24999999999999992,
									"rotationX": -104.50000000000001,
									"rotationY": -6.599999999999998,
									"rotationZ": -27.499999999999993,
									"time": -0.2
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_trails_Base_NoFlare",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
									"x": -1.4368466666666668,
									"y": -0.9861033333333333,
									"z": 0.180159999999999,
									"scaleX": 0.19999999999999998,
									"scaleY": 0.2,
									"scaleZ": 0.28,
									"rotationX": -93.9,
									"rotationY": 15.000000000000007,
									"rotationZ": 75.3,
									"time": -0.2
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_trails_Base_NoFlare",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
									"x": 1.1443033333333332,
									"y": -0.12977333333333352,
									"z": -0.06417000000000073,
									"scaleX": 0.25,
									"scaleY": 0.24999999999999997,
									"scaleZ": 0.47,
									"rotationX": -101.70000000000003,
									"rotationY": -11.000000000000004,
									"rotationZ": -45.999999999999986,
									"time": -0.2
								}
							]
						},
						{
							"type": "emitter",
							"name": "DirectionalSmoke_GasLeak",
							"props": {
								"enableSort": false,
								"emitSurface": true,
								"frameCount": 4,
								"animationSpeed": 0,
								"instSpeed": [
									0,
									0,
									10
								],
								"instStretch": [
									0.8,
									0.8,
									3
								],
								"lifeTime": 1.25,
								"lifeTimeRand": 0.1,
								"warmUpTime": -1.685,
								"emitType": "Burst",
								"instStretch_rand": [
									0.2,
									0.2,
									0.5
								],
								"instScale_rand": 0.2,
								"seedGroup": 3,
								"useRandomColor": true,
								"randomColor1": [
									0.8235294117647058,
									0.7686274509803921,
									0.7176470588235294,
									1
								],
								"instSpeed_rand": [
									0,
									0,
									2.5
								],
								"maxCount": 1,
								"randomColor2": [
									0.9764705882352941,
									0.9647058823529412,
									0.9529411764705882,
									1
								],
								"instRotation_rand": [
									0,
									0,
									0
								],
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2.png",
								"instScale": 0.725
							},
							"x": -0.49024,
							"y": -0.59279,
							"z": -1.39478,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationX": -51.9,
							"rotationY": -114.5,
							"rotationZ": -5.8,
							"children": [
								{
									"type": "model",
									"name": "CylinderCone_StraightUV",
									"source": "Fx/Meshes_Common/BendedCrossPlane.fbx",
									"scaleX": 0.5,
									"scaleY": 0.2,
									"scaleZ": 0.5,
									"rotationX": 90,
									"rotationZ": -90,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": true,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 0.5
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
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.65
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": -0.0050000000000000044,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.039999999999999994,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00782367857939008,
																"dt": -0.03520655360725527
															},
															"nextHandle": {
																"dv": -0.15000000000000002,
																"dt": 0.674375
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.15625
															},
															"nextHandle": {
																"dv": 0.03384085855991686,
																"dt": 0.3197961133912159
															}
														}
													]
												}
											]
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
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 0.1,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0.1,
												"width": 1,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/causticTexture_03-2-Blured.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.05
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
																"dv": 0.17597127610376737,
																"dt": -0.6268976711196711
															},
															"nextHandle": {
																"dv": -0.1333333333333333,
																"dt": 0.47500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.009090909090909038,
																"dt": -0.4642857142857143
															},
															"nextHandle": {
																"dv": 0.008539703073546545,
																"dt": 0.4361348355418391
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.4,
												"sandColorSet": false,
												"envBlend": 0.3,
												"envColorSet": false
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.832419311974865,
												"dt": -0.023411793149293023
											},
											"nextHandle": {
												"dv": 0.5333333333333332,
												"dt": 0.015
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.885
											},
											"nextHandle": {
												"dv": -1.3607186657192811e-16,
												"dt": 0.33333333333333326
											}
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 3.0890297805850073,
												"dt": -0.11575828486016804
											},
											"nextHandle": {
												"dv": -0.9363636363636363,
												"dt": 0.03508928571428571
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.009090909090909038,
												"dt": -0.6245892857142856
											},
											"nextHandle": {
												"dv": 0.008774267419493307,
												"dt": 0.6028344762228577
											}
										}
									]
								}
							]
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_Low_Local",
							"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local.fx",
							"enabled": false,
							"y": -0.3005,
							"z": 3.05609,
							"scaleX": 0.75,
							"scaleY": 0.75,
							"scaleZ": 0.75,
							"time": -0.3
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.7,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						},
						{
							"type": "object",
							"name": "LightDecals",
							"enabled": false,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Explo01",
									"z": -2.53051,
									"scaleX": 7,
									"scaleY": 7.5,
									"scaleZ": 5,
									"rotationX": 90,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0.060286413712068665,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.17404910478720237,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9508423608531043,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.3625240054869698
															},
															"nextHandle": {
																"dv": 0.004145123828510827,
																"dt": 0.33331459999053903
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Explo02",
									"x": -1.08543,
									"z": -1.47481,
									"scaleX": 6,
									"scaleY": 6,
									"scaleZ": 4,
									"rotationX": 90,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 2.1693051822019154,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 2.283067873277049,
															"value": 0.9,
															"mode": 2
														},
														{
															"time": 5.21982145201236,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.3625240054869698
															},
															"nextHandle": {
																"dv": 0.004145123828510827,
																"dt": 0.33331459999053903
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "subFX",
							"name": "FX_DeathFinalExplosion",
							"source": "Fx/Vehicle/Ships/FX_DeathFinalExplosion_Photosensitive.fx",
							"x": -1.11599,
							"y": 0.88235,
							"z": 0.80477,
							"scaleX": 0.35,
							"scaleY": 0.35,
							"scaleZ": 0.35,
							"rotationX": 180,
							"rotationZ": -25,
							"time": 4.5418
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Explosion",
					"target": "FXAnimation.FXRoot.Altar.root.B_RootJ.B_MainJ"
				},
				{
					"type": "polygon",
					"name": "Floor",
					"editorOnly": true,
					"locked": true,
					"z": 0.08361,
					"scaleX": 100,
					"scaleY": 100,
					"scaleZ": 70,
					"rotationZ": 180,
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
									"mode": "PBR",
									"blend": "None",
									"shadows": true,
									"culling": "Back",
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false
								}
							},
							"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png"
						}
					]
				}
			]
		}
	]
}