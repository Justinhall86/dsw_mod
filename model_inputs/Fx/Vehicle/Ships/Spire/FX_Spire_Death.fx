{
	"type": "fx",
	"duration": 8,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "death",
					"children": [
						{
							"type": "subFX",
							"name": "FX_Explosion_Mid_Local",
							"source": "Fx/Explosion/FX_Explosion_Mid_Local.fx",
							"x": 0.14192,
							"y": -0.05312,
							"z": -0.2275,
							"scaleX": 0.125,
							"scaleY": 0.125,
							"scaleZ": 0.125,
							"time": -0.1
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_Low_Local",
							"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local.fx",
							"x": 0.14179,
							"y": -0.04577,
							"z": -0.19054,
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.25,
							"rotationX": -22.8,
							"rotationY": 170.9,
							"rotationZ": -5.9,
							"time": -0.35
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_trails_Base_NoFlare",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_World.fx",
							"x": 0.10483,
							"y": -0.09302,
							"z": 0.00858,
							"scaleX": 0.07,
							"scaleY": 0.07,
							"scaleZ": 0.17,
							"rotationX": -22.8,
							"rotationY": 170.9,
							"rotationZ": -5.9,
							"time": -0.1
						},
						{
							"type": "emitter",
							"name": "Smoke",
							"props": {
								"instScale_rand": 0.5,
								"maxCount": 100,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
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
								"emitRate": 10,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
								"instScale": 2.5,
								"burstDelay": 0.05,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"emitShape": "Cone",
								"emitRad1": 0.83,
								"emitSurface": true,
								"lifeTimeRand": 0.5,
								"alignMode": "Screen",
								"emitAngle": 10.91,
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instWorldAcceleration_rand": [
									0,
									0.05,
									0
								],
								"lifeTime": 2,
								"instSpeed": [
									2.5,
									0,
									0
								],
								"instSpeed_rand": [
									0.75,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"speedFactor": 0.5,
								"instWorldAcceleration": [
									0,
									0.15,
									0
								],
								"enableSort": false,
								"instAcceleration": [
									0.55,
									0,
									0
								],
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
										},
										{
											"position": 1,
											"color": -1
										}
									],
									"resolution": 64,
									"isVertical": false,
									"interpolation": "Linear",
									"colorMode": 0
								}
							},
							"x": 0.14179,
							"y": -0.04577,
							"z": -0.19054,
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.25,
							"rotationX": 71.9,
							"rotationY": 34.4,
							"rotationZ": 57.8,
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
												"alpha": 0.7
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
															"prevHandle": {
																"dv": 0.07434815435096212,
																"dt": -0.013591771967285254
															},
															"nextHandle": {
																"dv": -0.4,
																"dt": 0.07096513271331795
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.7934098672866821
															},
															"nextHandle": {
																"dv": 0.013450431843066416,
																"dt": 0.32003621266595966
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
													0.13725490196078433,
													0.13725490196078433,
													0.13725490196078433
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
												"range": 0.5,
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
												"progress": 0.58,
												"saturation": 0,
												"width": 0.73,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.02,
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.7,
															"prevHandle": {
																"dv": 0.4440584429210647,
																"dt": -0.6148501517368579
															},
															"nextHandle": {
																"dv": -0.21666666666666667,
																"dt": 0.3
															}
														},
														{
															"time": 1,
															"value": 0.1,
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
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.7,
															"prevHandle": {
																"dv": 0.014566585838585378,
																"dt": -0.6342958859534329
															},
															"nextHandle": {
																"dv": -0.010000000000000009,
																"dt": 0.4346090534979425
															}
														},
														{
															"time": 1,
															"value": 0.1,
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
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.75,
											"topSpan": 0.8,
											"dirBrighten": true,
											"dirIntensity": 0.8,
											"dirSpan": 0.9,
											"envBlend": 0.5
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
											"value": 0.4,
											"prevHandle": {
												"dv": 1.770541378103658e-17,
												"dt": -0.501347997139875
											},
											"nextHandle": {
												"dv": -5.551115123125783e-17,
												"dt": 0.7166621860796936
											}
										},
										{
											"time": 1,
											"value": 0.9,
											"prevHandle": {
												"dv": -0.10219946215442799,
												"dt": -0.79
											},
											"nextHandle": {
												"dv": 0.0338972586912773,
												"dt": 0.267255905650836
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keys": [
										{
											"time": 0.10596387624740589,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.1159638762474059,
											"value": 3,
											"mode": 2
										},
										{
											"time": 1.0013437103503637,
											"value": 4,
											"prevHandle": {
												"dv": 0.068856631889373,
												"dt": -0.5087357346003939
											},
											"nextHandle": {
												"dv": -0.20000000000000018,
												"dt": 1.4776666259765627
											}
										},
										{
											"time": 3.001599752830833,
											"value": 0,
											"prevHandle": {
												"dv": 2.3,
												"dt": -0.2600790191418243
											},
											"nextHandle": {
												"dv": -7.546109222917908,
												"dt": 0.8532976891450273
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
											"prevHandle": {
												"dv": 1.9871071861164984e-16,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.8809876543209877
											}
										},
										{
											"time": 1,
											"value": 0,
											"prevHandle": {
												"dv": -0.01282051282051282,
												"dt": -0.21777777777777785
											},
											"nextHandle": {
												"dv": 0.019664722888838422,
												"dt": 0.3332806368123195
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instAcceleration.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"prevHandle": {
												"dv": -2.9644666370982153,
												"dt": -0.3062152491313287
											},
											"nextHandle": {
												"dv": 0.7744791666666667,
												"dt": 0.07888888888888891
											}
										},
										{
											"time": 1,
											"value": 1,
											"prevHandle": {
												"dv": -0.025520833333333326,
												"dt": -0.9566666666666667
											},
											"nextHandle": {
												"dv": 0.00890255983233487,
												"dt": 0.3333312198447246
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "LightDecals_NoPhotosensitive",
							"children": [
								{
									"type": "advancedDecal",
									"name": "ElectricitySmallLight_02",
									"x": 0.20672,
									"y": 0.09837,
									"z": -0.24026,
									"scaleZ": 0.4,
									"rotationZ": 27.5,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 45,
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
												"scale": 0.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 1.996735546814799,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.0067355468147987,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.2565940126373754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.522091922159655,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.532091922159653,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.755229873056871,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.0464843750000012,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.056484375000001,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.2906250000000012,
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
													0.4666666666666667,
													0.8352941176470589,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3.25,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													-0.2
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
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.01,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5274218750000008,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5374218750000006,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Explo01",
									"x": 0.25359,
									"y": 0.01297,
									"z": -0.1784,
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 0.25,
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
															"time": 0.04375737680719308,
															"value": -0.01666666666666672
														},
														{
															"time": 0.04375737680719308,
															"value": -0.01666666666666672
														},
														{
															"time": 0.07497213065569178,
															"value": 0.8
														},
														{
															"time": 0.12895887217876556,
															"value": 0.25
														},
														{
															"time": 0.12895887217876556,
															"value": 0.25
														},
														{
															"time": 0.1738060593523078,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.1510433707598775,
															"value": 0,
															"prevHandle": {
																"dv": -0.03361111111111109,
																"dt": -1.2375161720483672
															},
															"nextHandle": {
																"dv": 0.009138021331372042,
																"dt": 0.3333112237249949
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
										},
										{
											"type": "curve",
											"name": "visibility",
											"enabled": false,
											"keys": [
												{
													"time": 0.4880929892510185,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.4980929892510185,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5311090224236255,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5479840224236256,
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
							"type": "object",
							"name": "Electricity",
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "object",
									"name": "Elec01",
									"x": 0.95435,
									"y": -0.04597,
									"z": 0.16283,
									"scaleX": 0.7,
									"scaleY": 0.7,
									"scaleZ": 0.7,
									"rotationX": -178.4,
									"rotationY": -9.5,
									"rotationZ": -56.4,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4.png",
												"instScale_rand": 0,
												"warmUpTime": -1,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.2,
													1,
													1
												],
												"lifeTime": 0.15,
												"burstCount": 3,
												"burstDelay": 2.75,
												"randomGradient": {
													"stops": [
														{
															"position": 0,
															"color": -16777216
														},
														{
															"position": 1,
															"color": -1
														}
													],
													"resolution": 64,
													"isVertical": false,
													"interpolation": "Linear",
													"colorMode": 0
												}
											},
											"x": -0.12397,
											"y": -0.64362,
											"z": -0.00093,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": 27.2,
											"rotationZ": 16.2,
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
																	"culling": "None",
																	"colorMask": 255,
																	"depthTest": "Less",
																	"emissive": 10
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.9,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
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
															0.33725490196078434,
															0.5137254901960784,
															0.996078431372549
														]
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Elec02",
									"x": -0.24457,
									"y": 1.38322,
									"z": -0.90362,
									"rotationX": 18.7,
									"rotationY": 63.8,
									"rotationZ": -154.4,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_01.png",
												"instScale_rand": 0,
												"warmUpTime": -1.5,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.2,
													0.95,
													1
												],
												"lifeTime": 0.1,
												"instScale": 0.8,
												"burstCount": 3,
												"burstDelay": 0.5,
												"randomGradient": {
													"stops": [
														{
															"position": 0,
															"color": -16777216
														},
														{
															"position": 1,
															"color": -1
														}
													],
													"resolution": 64,
													"isVertical": false,
													"interpolation": "Linear",
													"colorMode": 0
												}
											},
											"x": -0.11271,
											"y": 1.20256,
											"z": -0.28382,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": 7.1,
											"rotationZ": 59.5,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": 0.25,
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
																	"culling": "None",
																	"colorMask": 255,
																	"depthTest": "Less",
																	"emissive": 10
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.9,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
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
															0.33725490196078434,
															0.5137254901960784,
															0.996078431372549
														]
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Elec03",
									"x": 0.37564,
									"y": 0.61142,
									"z": -1.46811,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"rotationX": -174.3,
									"rotationY": 12.1,
									"rotationZ": -41.3,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_02.png",
												"instScale_rand": 0,
												"warmUpTime": -1,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.45,
													0.95,
													1
												],
												"lifeTime": 0.1,
												"instScale": 1.2,
												"burstCount": 2,
												"burstDelay": 0.25,
												"randomGradient": {
													"stops": [
														{
															"position": 0,
															"color": -16777216
														},
														{
															"position": 1,
															"color": -1
														}
													],
													"resolution": 64,
													"isVertical": false,
													"interpolation": "Linear",
													"colorMode": 0
												}
											},
											"x": -1.29822,
											"y": 0.2782,
											"z": -2.35401,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": 29.5,
											"rotationY": 22.4,
											"rotationZ": -32.1,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": 0.25,
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
																	"culling": "None",
																	"colorMask": 255,
																	"depthTest": "Less",
																	"emissive": 10
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.9,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
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
															0.33725490196078434,
															0.5137254901960784,
															0.996078431372549
														]
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Elec04",
									"x": -0.36772,
									"y": 0.89563,
									"z": -1.01225,
									"scaleX": 0.4,
									"scaleY": 0.4,
									"scaleZ": 0.4,
									"rotationX": 122.7,
									"rotationY": -42.1,
									"rotationZ": 104.1,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_02.png",
												"instScale_rand": 0,
												"warmUpTime": -1.05,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.5,
													0.8,
													1
												],
												"lifeTime": 0.1,
												"instScale": 1.8,
												"burstCount": 2,
												"burstDelay": 2,
												"randomGradient": {
													"stops": [
														{
															"position": 0,
															"color": -16777216
														},
														{
															"position": 1,
															"color": -1
														}
													],
													"resolution": 64,
													"isVertical": false,
													"interpolation": "Linear",
													"colorMode": 0
												}
											},
											"x": -1.10477,
											"y": 2.97534,
											"z": 0.14617,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": 4.6,
											"rotationY": 19.5,
											"rotationZ": -32.9,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": 0.25,
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
																	"culling": "None",
																	"colorMask": 255,
																	"depthTest": "Less",
																	"emissive": 10
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 1,
																"power": 1
															},
															"isInstance": true
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
															0.33725490196078434,
															0.5137254901960784,
															0.996078431372549
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sparkles01",
									"props": {
										"emitType": "Burst",
										"burstParticleCount": 10,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 57.27,
										"instSpeed": [
											7,
											0,
											0
										],
										"lifeTime": 0.45,
										"warmUpTime": -4,
										"emitSurface": true,
										"instStretch": [
											2.2,
											1,
											1
										],
										"instScale": 0.3,
										"instScale_rand": 0.1,
										"instSpeed_rand": [
											4,
											0,
											0
										],
										"speedFactor": 2,
										"instStretch_rand": [
											0.25,
											0,
											0
										],
										"useRandomColor": true,
										"randomColor1": [
											0.10196078431372549,
											0.3411764705882353,
											1,
											1
										],
										"randomColor2": [
											0.7137254901960784,
											0.17254901960784313,
											0.17254901960784313,
											1
										],
										"lifeTimeRand": 0.2,
										"burstCount": 2,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"x": 0.11868,
									"y": -0.24319,
									"z": -0.2016,
									"scaleY": 1.0000000000000002,
									"rotationX": -79.7,
									"rotationY": 137.3,
									"rotationZ": -31.5,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"rotationZ": 90,
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
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"textureWrap": true,
															"emissive": 50
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/Spark.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.9666666666666667,
																	"prevHandle": {
																		"dv": 1.3450505427640504,
																		"dt": -0.2952549971921085
																	},
																	"nextHandle": {
																		"dv": -0.6833333333333333,
																		"dt": 0.15000000000000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26
																	},
																	"nextHandle": {
																		"dv": -2.7214566023630135e-16,
																		"dt": 0.33333569371893157
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.9666666666666667,
																	"prevHandle": {
																		"dv": -0.02352170282676526,
																		"dt": -0.6051452312104698
																	},
																	"nextHandle": {
																		"dv": 0.03222222222222226,
																		"dt": 0.8296093750000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26
																	},
																	"nextHandle": {
																		"dv": -2.7214566023630135e-16,
																		"dt": 0.33333569371893157
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.x",
											"keys": [
												{
													"time": 0.06,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0.325,
													"prevHandle": {
														"dv": -0.0214444444444446,
														"dt": -0.44000000000000006
													},
													"nextHandle": {
														"dv": 0.0214444444444446,
														"dt": 0.44000000000000006
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.52
													},
													"nextHandle": {
														"dv": -5.442874662877125e-16,
														"dt": 0.33333333333333326
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
													"value": 0,
													"prevHandle": {
														"dv": -2.524747126051018,
														"dt": -0.08435811334917986
													},
													"nextHandle": {
														"dv": 1.1363636363636365,
														"dt": 0.038593750000000024
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0.015151515151515138,
														"dt": -0.6513281249999998
													},
													"nextHandle": {
														"dv": -0.007748222232672166,
														"dt": 0.333317624512036
													}
												}
											]
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Spire",
					"source": "Vehicle/Fremen/OrnithopterF/Ornithopter_F.fbx",
					"enabled": false,
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Ornithopter/Anim_Ornithopter_Death01.fbx"
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.death",
					"target": "FXAnimation.FXRoot.Spire.root.B_ROOTJ.B_Chassis"
				}
			]
		}
	]
}