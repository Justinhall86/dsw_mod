{
	"type": "fx",
	"duration": 6,
	"cullingRadius": 1000,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "subFX",
					"name": "Ability_ToxicVapors",
					"source": "Fx/Abilities/Ability_ToxicVapors.fx",
					"enabled": false,
					"x": -128.671,
					"y": 67.46667
				},
				{
					"type": "object",
					"name": "PoisonPurple",
					"y": 30.10314,
					"children": [
						{
							"type": "advancedDecal",
							"name": "FloorVapors",
							"enabled": false,
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 25,
							"rotationZ": 87.51929319675823,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.75,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.05,
											0.04
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.34,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/T_ElecNoise01.png",
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
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 3,
										"power": 0.8
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.38431372549019605,
											0.21568627450980393,
											0.20784313725490194
										],
										"pointA": 1,
										"colorB": [
											0.6470588235294118,
											0.5137254901960784,
											0.39215686274509803
										],
										"pointB": 1
									}
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.24313725490196078,
											0.15294117647058825,
											0
										],
										"pointA": 0.27,
										"colorB": [
											0.4196078431372549,
											0.49411764705882355,
											0
										],
										"pointB": 1
									}
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.24313725490196078,
											0.28627450980392155,
											0
										],
										"pointA": 0.27,
										"colorB": [
											0.4196078431372549,
											0.49411764705882355,
											0
										],
										"pointB": 1
									}
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.13333333333333333,
											0.34509803921568627,
											0.08627450980392157
										],
										"pointA": 0,
										"colorB": [
											0.24313725490196078,
											0.5058823529411764,
											0.18823529411764706
										],
										"pointB": 0.58
									}
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 150,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.75,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "DotsFloor",
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 20,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"emissive": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "WorldUV",
									"source": "shaders/WorldUV.hx",
									"props": {
										"useNormalMap": false,
										"onDecal": true,
										"scale": 0.008,
										"rotation": 0
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
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
										"progress": 0.64,
										"saturation": 0,
										"width": 0.15,
										"uvScaleX": 4,
										"uvScaleY": 4,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.025,
											null
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.26,
										"saturation": 0,
										"width": 0.52,
										"uvScaleX": 10,
										"uvScaleY": 10,
										"texture": "Fx/noise/FlareNoise.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.01,
											null
										]
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.4196078431372549,
											0.49411764705882355,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.38431372549019605,
											0.21568627450980393,
											0.20784313725490194
										],
										"pointA": 1,
										"colorB": [
											0.6470588235294118,
											0.5137254901960784,
											0.39215686274509803
										],
										"pointB": 1
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "FloorVapors_details",
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 20,
							"rotationZ": 88.35197518248175,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "WorldUV",
									"source": "shaders/WorldUV.hx",
									"props": {
										"useNormalMap": false,
										"onDecal": true,
										"scale": 0.025,
										"rotation": 0
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.17,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 0.75,
										"uvScaleY": 0.75,
										"texture": "Fx/noise/causticTexture_04.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.03,
											-0.025
										],
										"uvScaleSpeed": [
											0,
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.42,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/T_ElecNoise01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.03,
											0.025
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.16078431372549018,
											0.3058823529411765,
											0.1803921568627451
										],
										"pointA": 0,
										"colorB": [
											0.8862745098039215,
											1,
											0.2588235294117647
										],
										"pointB": 0.54
									}
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.16078431372549018,
											0.3058823529411765,
											0.1803921568627451
										],
										"pointA": 0,
										"colorB": [
											0.792156862745098,
											0.9333333333333333,
											0
										],
										"pointB": 0.54
									}
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.38823529411764707,
											0.19215686274509802,
											0.5882352941176471
										],
										"pointA": 1,
										"colorB": [
											0.5764705882352941,
											0.24313725490196078,
											0.9176470588235294
										],
										"pointB": 1
									}
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.24313725490196078,
											0.28627450980392155,
											0
										],
										"pointA": 0.27,
										"colorB": [
											0.4196078431372549,
											0.49411764705882355,
											0
										],
										"pointB": 1
									}
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 400,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Bubbles",
							"props": {
								"lifeTime": 3,
								"emitRate": 4,
								"maxCount": 15,
								"instScale": 8,
								"instScale_rand": 4,
								"useRandomColor": true,
								"randomColor1": [
									0.6,
									0.6,
									0.6,
									1
								],
								"instRotation_rand": [
									0,
									0,
									360
								],
								"lifeTimeRand": 1
							},
							"z": 1,
							"scaleX": 60,
							"scaleY": 60,
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
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 3
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"texture": "Fx/Alphas/T_SphereInvert01.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.37324346623743554
															},
															"nextHandle": {
																"dv": 0.029728712364460327,
																"dt": 0.33330480980464305
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.39,
												"saturation": 1,
												"width": 0.88,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.025,
													null
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/circGrad01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													null
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.02423737262951664,
																"dt": -0.29927840945800255
															},
															"nextHandle": {
																"dv": 0.02423737262951664,
																"dt": 0.29927840945800255
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
													0.4196078431372549,
													0.49411764705882355,
													0
												]
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
											"mode": 0,
											"prevHandle": {
												"dv": -1.4086259259711857,
												"dt": -0.4901377207616426
											},
											"nextHandle": {
												"dv": 0.8333333333333334,
												"dt": 0.28996207801094903
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.64
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.04114912760556359,
												"dt": -0.49996190040761035
											},
											"nextHandle": {
												"dv": 0.03333333333333333,
												"dt": 0.405
											}
										},
										{
											"time": 1.435,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.614725913694349,
											"value": 1,
											"mode": 0
										},
										{
											"time": 6,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.46930516719818005
											},
											"nextHandle": {
												"dv": -2.398428290550722e-16,
												"dt": 0.33499999999999996
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
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Poison",
					"enabled": false,
					"y": 77.17175,
					"children": [
						{
							"type": "advancedDecal",
							"name": "FloorVapors",
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 25,
							"rotationZ": 87.51929319675823,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"alpha": 0.4,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
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
										"progress": 0.75,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.05,
											0.04
										]
									}
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
										"saturation": 0,
										"width": 1,
										"uvScaleX": 0.75,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.04,
											0.1
										],
										"uvScaleSpeed": [
											0,
											0
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
										"range": 3,
										"power": 0.8
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.13333333333333333,
											0.34509803921568627,
											0.08627450980392157
										],
										"pointA": 0,
										"colorB": [
											0.24313725490196078,
											0.5058823529411764,
											0.18823529411764706
										],
										"pointB": 0.58
									}
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 150,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.75,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "DotsFloor",
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 20,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "WorldUV",
									"source": "shaders/WorldUV.hx",
									"props": {
										"useNormalMap": false,
										"onDecal": true,
										"scale": 0.01,
										"rotation": 0
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
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
										"progress": 0.64,
										"saturation": 0,
										"width": 0.15,
										"uvScaleX": 4,
										"uvScaleY": 4,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.025,
											null
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.26,
										"saturation": 0,
										"width": 0.52,
										"uvScaleX": 10,
										"uvScaleY": 10,
										"texture": "Fx/noise/FlareNoise.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.01,
											null
										]
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 0.5,
										"color": [
											0.6196078431372549,
											0.807843137254902,
											0.11372549019607843
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "FloorVapors_details",
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 20,
							"rotationZ": 88.35197518248175,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.75,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "WorldUV",
									"source": "shaders/WorldUV.hx",
									"props": {
										"useNormalMap": false,
										"onDecal": true,
										"scale": 0.03,
										"rotation": 0
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.17,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 0.75,
										"uvScaleY": 0.75,
										"texture": "Fx/noise/causticTexture_04.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.03,
											-0.025
										],
										"uvScaleSpeed": [
											0,
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.25,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1.5,
										"uvScaleY": 1.5,
										"texture": "Fx/noise/causticTexture_04.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.03,
											0.025
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.21568627450980393,
											0.4627450980392157,
											0.16078431372549018
										],
										"pointA": 0,
										"colorB": [
											0.6196078431372549,
											0.807843137254902,
											0.11372549019607843
										],
										"pointB": 0.58
									}
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 400,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.13333333333333333,
											0.34509803921568627,
											0.08627450980392157
										],
										"pointA": 0,
										"colorB": [
											0.24313725490196078,
											0.5058823529411764,
											0.18823529411764706
										],
										"pointB": 0.58
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"enabled": false,
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.75,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter",
							"props": {
								"lifeTime": 3,
								"emitRate": 2,
								"maxCount": 5,
								"instScale": 8,
								"instScale_rand": 4,
								"useRandomColor": true,
								"randomColor1": [
									0.6,
									0.6,
									0.6,
									1
								],
								"instRotation_rand": [
									0,
									0,
									360
								],
								"lifeTimeRand": 1
							},
							"z": 1,
							"scaleX": 30,
							"scaleY": 30,
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
													"colorMask": 255,
													"emissive": 0.75
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"texture": "Fx/Alphas/T_SphereInvert01.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.37324346623743554
															},
															"nextHandle": {
																"dv": 0.029728712364460327,
																"dt": 0.33330480980464305
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.39,
												"saturation": 1,
												"width": 0.88,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.025,
													null
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/circGrad01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													null
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.02423737262951664,
																"dt": -0.29927840945800255
															},
															"nextHandle": {
																"dv": 0.02423737262951664,
																"dt": 0.29927840945800255
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
													0.6196078431372549,
													0.807843137254902,
													0.11372549019607843
												]
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
											"mode": 0,
											"prevHandle": {
												"dv": -1.4086259259711857,
												"dt": -0.4901377207616426
											},
											"nextHandle": {
												"dv": 0.8333333333333334,
												"dt": 0.28996207801094903
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
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
								"sandBlend": 0,
								"sandColorSet": false,
								"envBlend": 0.1,
								"envColorSet": false
							}
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.64
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.04114912760556359,
												"dt": -0.49996190040761035
											},
											"nextHandle": {
												"dv": 0.03333333333333333,
												"dt": 0.405
											}
										},
										{
											"time": 1.435,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.614725913694349,
											"value": 1,
											"mode": 0
										},
										{
											"time": 6,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.46930516719818005
											},
											"nextHandle": {
												"dv": -2.398428290550722e-16,
												"dt": 0.33499999999999996
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
								"sandBlend": 0.7,
								"sandColorSet": false,
								"envBlend": 0.75,
								"envColorSet": false
							},
							"isInstance": true,
							"children": [
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.75,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Poison_Backup",
					"enabled": false,
					"y": 47.07925,
					"z": 4.07739,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"y": 1.16636,
							"z": -1.14787,
							"scaleX": 100,
							"scaleY": 100,
							"scaleZ": 50,
							"albedoMap": "Fx/Alphas/TS_Dust_02.png",
							"fadePower": 1.5,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 4,
										"vScale": 4,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/noise/Wave_01.jpg"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "vOffset",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 10,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "WorldUV",
									"source": "shaders/WorldUV.hx",
									"enabled": false,
									"props": {
										"useNormalMap": false,
										"onDecal": true,
										"scale": 0.02,
										"rotation": 0
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 0,
										"width": 0.33,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.005
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.23,
										"saturation": 0,
										"width": 0.13,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.0025
										]
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0.3529411764705882,
											0.027450980392156862
										]
									}
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.13333333333333333,
											0.34509803921568627,
											0.08627450980392157
										],
										"pointA": 0,
										"colorB": [
											0.24313725490196078,
											0.5058823529411764,
											0.18823529411764706
										],
										"pointB": 0.58
									}
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.21568627450980393,
											0.4627450980392157,
											0.16078431372549018
										],
										"pointA": 0,
										"colorB": [
											0.6196078431372549,
											0.807843137254902,
											0.11372549019607843
										],
										"pointB": 0.58
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"y": -0.58318,
							"z": -2.83792,
							"scaleX": 80,
							"scaleY": 80,
							"kind": 0,
							"args": [
								10
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
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
									},
									"diffuseMap": "Fx/Alphas/TS_Dust_02.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.7
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 3,
										"vScale": 3,
										"uOffset": 0,
										"vOffset": 0.2,
										"texture": "Fx/noise/Wave_01.jpg"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "vOffset",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 10,
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 0,
										"width": 0.37,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.01,
											null
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.27,
										"saturation": 0,
										"width": 0.25,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.005,
											null
										]
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.13333333333333333,
											0.34509803921568627,
											0.08627450980392157
										]
									}
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"texScaleX": 2,
										"texScaleY": 2,
										"tex": "Fx/Alphas/T_Flag_red.png",
										"intensity": 0.5,
										"scrollSpeed": [
											0,
											0.1
										]
									}
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
							"type": "polygon",
							"name": "polygon",
							"y": -0.58318,
							"z": -2.83792,
							"scaleX": 80,
							"scaleY": 80,
							"kind": 0,
							"args": [
								10
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 2
										}
									},
									"diffuseMap": "Fx/Alphas/TS_Dust_02.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.7
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 3,
										"vScale": 3,
										"uOffset": 0,
										"vOffset": 0.2,
										"texture": "Fx/noise/Wave_01.jpg"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "vOffset",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 10,
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.64,
										"saturation": 0,
										"width": 0.15,
										"uvScaleX": 3,
										"uvScaleY": 3,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.02,
											null
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.26,
										"saturation": 0,
										"width": 0.52,
										"uvScaleX": 10,
										"uvScaleY": 10,
										"texture": "Fx/noise/FlareNoise.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.01,
											null
										]
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.24313725490196078,
											0.5058823529411764,
											0.18823529411764706
										]
									}
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"texScaleX": 2,
										"texScaleY": 2,
										"tex": "Fx/Alphas/T_Flag_red.png",
										"intensity": 0.5,
										"scrollSpeed": [
											0,
											0.1
										]
									}
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
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0,
								"sandColorSet": false,
								"envBlend": 0.1,
								"envColorSet": false
							}
						}
					]
				}
			]
		},
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
			"x": 528.65001,
			"y": 1111.05802,
			"z": 0.02,
			"scaleX": 4000,
			"scaleY": 4000,
			"scaleZ": 2,
			"color": -14869219,
			"kind": 0,
			"args": [
				0
			]
		},
		{
			"type": "object",
			"name": "Units",
			"editorOnly": true,
			"children": [
				{
					"type": "model",
					"name": "Male01_AtreideSoldier",
					"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
					"x": -1.5,
					"y": -1.5,
					"scaleX": 1.84,
					"scaleY": 1.84,
					"scaleZ": 1.84,
					"rotationZ": 89.99999999999999
				},
				{
					"type": "model",
					"name": "Male01_AtreideSoldier",
					"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
					"x": 1.5,
					"y": -1.5,
					"scaleX": 1.84,
					"scaleY": 1.84,
					"scaleZ": 1.84,
					"rotationZ": 89.99999999999999
				},
				{
					"type": "model",
					"name": "Male01_AtreideSoldier",
					"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
					"x": 1.5,
					"y": 1.5,
					"scaleX": 1.84,
					"scaleY": 1.84,
					"scaleZ": 1.84,
					"rotationZ": 89.99999999999999
				},
				{
					"type": "model",
					"name": "Male01_AtreideSoldier",
					"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
					"x": -1.5,
					"y": 1.5,
					"scaleX": 1.84,
					"scaleY": 1.84,
					"scaleZ": 1.84,
					"rotationZ": 89.99999999999999
				}
			]
		}
	]
}