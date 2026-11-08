{
	"type": "fx",
	"duration": 2,
	"cullingRadius": 50,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 50,
			"scaleY": 50,
			"scaleZ": 50,
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
		},
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 2.2,
			"scaleY": 2.2,
			"scaleZ": 2.2,
			"children": [
				{
					"type": "object",
					"name": "Wensicia",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Female01_ImperialWensicia",
							"source": "Character/Imperial/Wensicia/Female01_ImperialWensicia.fbx",
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/Wensicia/Anim_Female01_Wensicia_AttackRange.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Gun_Landsraad",
							"source": "Character/Common/Landsraad/Weapon/Gun_Landsraad.fbx",
							"x": -0.37666,
							"y": -0.0232,
							"z": 0.06688,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationZ": -90
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Wensicia.Gun_Landsraad",
							"target": "FXAnimation.FXRoot.Wensicia.Female01_ImperialWensicia.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_lPalmJ"
						}
					]
				},
				{
					"type": "object",
					"name": "MuzzleFront",
					"x": 1.87464,
					"z": 2.75774,
					"scaleX": 0.8,
					"scaleY": 0.8,
					"scaleZ": 0.8,
					"rotationY": -43.3,
					"children": [
						{
							"type": "emitter",
							"name": "Flash",
							"props": {
								"lifeTime": 0.05,
								"emitType": "Burst",
								"maxCount": 1,
								"alignMode": "Screen",
								"instScale": 5
							},
							"x": -1.11621,
							"y": -0.17277,
							"z": -0.4321,
							"scaleX": 0.0125,
							"scaleY": 0.0125,
							"scaleZ": 0.0125,
							"rotationY": 43.3,
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
													"depthTest": "LessEqual"
												}
											}
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.3,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle4.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9725490196078431,
													0.8352941176470589,
													0.6235294117647059
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 2.3379300329638317,
																"dt": -0.26072500472698734
															},
															"nextHandle": {
																"dv": -0.9849817788097429,
																"dt": 0.11
															}
														},
														{
															"time": 0.5399999999999999,
															"value": 0,
															"mode": 2
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
							"type": "emitter",
							"name": "Flash_Stars",
							"props": {
								"lifeTime": 0.05,
								"emitType": "Burst",
								"maxCount": 1,
								"alignMode": "Screen",
								"instScale": 5
							},
							"x": -1.11621,
							"y": -0.17277,
							"z": -0.4321,
							"scaleX": 0.0125,
							"scaleY": 0.0125,
							"scaleZ": 0.0125,
							"rotationY": 43.3,
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
													"emissive": 2,
													"depthTest": "LessEqual"
												}
											}
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare06_512.png"
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0.546875,
																"color": -151464545
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
												}
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "CircleMuzzle",
							"props": {
								"instScale_rand": 1,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.615686274509804,
									0.6470588235294118,
									0.7490196078431373,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"emitShape": "Box",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 3,
								"emitAngle": 1,
								"alignMode": "Screen",
								"lifeTime": 5,
								"emitRad1": 0.64,
								"emitRad2": 0.89,
								"randomColor2": [
									0.615686274509804,
									0.7490196078431373,
									0.7450980392156863,
									1
								],
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"emitRate": 1,
								"speedFactor": 3.7,
								"maxCount": 2,
								"frameDivisionX": 0,
								"frameDivisionY": 0,
								"emitType": "Burst",
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"burstDelay": 0.5,
								"seedGroup": 1,
								"warmUpTime": -0.1,
								"useRandomColor": true
							},
							"x": -1.11621,
							"y": -0.17277,
							"z": -0.4321,
							"scaleX": 0.0125,
							"scaleY": 0.0125,
							"scaleZ": 0.0125,
							"rotationY": 43.3,
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
													"textureWrap": true,
													"emissive": 10
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_FlatImpact02.png",
												"onDecal": false
											},
											"isInstance": true
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
													"keys": [
														{
															"time": 0,
															"value": 0.2833333333333333,
															"mode": 0,
															"prevHandle": {
																"dv": -1.6477951347620967,
																"dt": -9.080851668466424e-17
															},
															"nextHandle": {
																"dv": 0.8666666666666666,
																"dt": 0
															}
														},
														{
															"time": 0.45,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.29000000000000004
															},
															"nextHandle": {
																"dv": -2.9391523179536476e-16,
																"dt": 0.36
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
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.8,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.25,
													0.5
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
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 1.408519742567825,
																"dt": -0.014085197425678224
															},
															"nextHandle": {
																"dv": -1,
																"dt": 0.009999999999999995
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.62
															},
															"nextHandle": {
																"dv": -2.1771608536988747e-16,
																"dt": 0.3333350157390327
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
												"range": 1.7,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -151464545
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
												}
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
											"value": 0.07599276417989542,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0967067405187236,
												"dt": -0.009753923835968315
											},
											"nextHandle": {
												"dv": 1.1243749274261694,
												"dt": 0.009999999999999995
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.815
											},
											"nextHandle": {
												"dv": -1.582726646250665e-16,
												"dt": 0.2500018203703057
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
							"type": "object",
							"name": "Muzzle",
							"x": -0.82331,
							"y": -0.22436,
							"z": -0.57835,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"rotationY": 31.7,
							"rotationZ": 0.2,
							"children": [
								{
									"type": "polygon",
									"name": "Muzzle Mesh",
									"y": 0.00214,
									"z": 0.03644,
									"scaleX": 1.25,
									"scaleY": 1.25,
									"scaleZ": 1.25,
									"rotationY": -45,
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
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 1.5
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
												"texture": "Fx/Alphas/T_FlatFlash.png"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.8,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													1.5
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
															"time": 0.34091573020734844,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.34091573020734844,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.49344094974729225
															}
														},
														{
															"time": 1.6455178011148863,
															"value": -0.014914336029688502,
															"mode": 0,
															"prevHandle": {
																"dv": 0.015162908296849964,
																"dt": -1.1299093125850823
															},
															"nextHandle": {
																"dv": -0.0064241497665561455,
																"dt": 0.4815334017558196
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.4683179091155687,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.49344094974729225
															}
														},
														{
															"time": 1.9998336366429112,
															"value": -0.014914336029688502,
															"mode": 0,
															"prevHandle": {
																"dv": 0.015162908296849964,
																"dt": -1.1299093125850823
															},
															"nextHandle": {
																"dv": -0.0064241497665561455,
																"dt": 0.4815334017558196
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": -0.020371727017777896,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 1.408519742567825,
																"dt": -0.014085197425678224
															},
															"nextHandle": {
																"dv": -1,
																"dt": 0.009999999999999995
															}
														},
														{
															"time": 0.9049319405837037,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.62
															},
															"nextHandle": {
																"dv": -2.1771608536988747e-16,
																"dt": 0.3333350157390327
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.024030893681319943,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.04872201806171739,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": -0.8723667347431184,
																"dt": 0.07999999999999996
															}
														},
														{
															"time": 0.2504947895017598,
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
													0.9725490196078431,
													0.8352941176470589,
													0.6235294117647059
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.01802393704458327,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -3.304985487287721,
														"dt": -0.22508576390955617
													},
													"nextHandle": {
														"dv": 1.3109146118164066,
														"dt": 0.09000000000000001
													}
												},
												{
													"time": 0.48473919775569174,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "position.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.03972782218845794,
													"value": 0.1,
													"mode": 0,
													"prevHandle": {
														"dv": -1.4055177299392094,
														"dt": -0.30184489345109466
													},
													"nextHandle": {
														"dv": 1.4055177299392094,
														"dt": 0.30184489345109466
													}
												},
												{
													"time": 1.6425939496380557,
													"value": 5,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "Muzzle Mesh",
									"scaleX": 1.25,
									"scaleY": 1.25,
									"scaleZ": 1.25,
									"rotationY": 45,
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
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 1.5
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
												"texture": "Fx/Alphas/T_FlatFlash.png"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.8,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													1.5
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
															"time": 0.34091573020734844,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.34091573020734844,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.49344094974729225
															}
														},
														{
															"time": 1.6455178011148863,
															"value": -0.014914336029688502,
															"mode": 0,
															"prevHandle": {
																"dv": 0.015162908296849964,
																"dt": -1.1299093125850823
															},
															"nextHandle": {
																"dv": -0.0064241497665561455,
																"dt": 0.4815334017558196
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.4683179091155687,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.49344094974729225
															}
														},
														{
															"time": 1.9998336366429112,
															"value": -0.014914336029688502,
															"mode": 0,
															"prevHandle": {
																"dv": 0.015162908296849964,
																"dt": -1.1299093125850823
															},
															"nextHandle": {
																"dv": -0.0064241497665561455,
																"dt": 0.4815334017558196
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": -0.020371727017777896,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 1.408519742567825,
																"dt": -0.014085197425678224
															},
															"nextHandle": {
																"dv": -1,
																"dt": 0.009999999999999995
															}
														},
														{
															"time": 0.9049319405837037,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.62
															},
															"nextHandle": {
																"dv": -2.1771608536988747e-16,
																"dt": 0.3333350157390327
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.024030893681319943,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.04872201806171739,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": -0.8723667347431184,
																"dt": 0.07999999999999996
															}
														},
														{
															"time": 0.2504947895017598,
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
													0.9725490196078431,
													0.8352941176470589,
													0.6235294117647059
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.01802393704458327,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -3.304985487287721,
														"dt": -0.22508576390955617
													},
													"nextHandle": {
														"dv": 1.3109146118164066,
														"dt": 0.09000000000000001
													}
												},
												{
													"time": 0.48473919775569174,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "position.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.03972782218845794,
													"value": 0.1,
													"mode": 0,
													"prevHandle": {
														"dv": -1.4055177299392094,
														"dt": -0.30184489345109466
													},
													"nextHandle": {
														"dv": 1.4055177299392094,
														"dt": 0.30184489345109466
													}
												},
												{
													"time": 1.6425939496380557,
													"value": 5,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Distort",
							"enabled": false,
							"props": {
								"instScale_rand": 0,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.2,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9098039215686274,
									0.615686274509804,
									1,
									0.8509803921568627
								],
								"emitRate": 10,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"lifeTime": 0.4,
								"emitType": "Burst",
								"burstDelay": 0.1,
								"instScale": 3,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"animationLoop": false,
								"instRotation": [
									0,
									90,
									0
								]
							},
							"x": -1.12741,
							"y": -0.37,
							"z": -0.373,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationY": 29.4,
							"children": [
								{
									"type": "model",
									"name": "Ring",
									"source": "Fx/Meshes_Common/Disk_StraightUVs.fbx",
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Distortion",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"culling": "None"
												}
											},
											"diffuseMap": "Fx/noise/causticTexture_03-2.png"
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/perlin2Normal.jpg",
												"intensity": 0.03
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.8043636363636364,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1438836500205134,
																"dt": -0.4763721338556696
															},
															"nextHandle": {
																"dv": -0.2551111111111112,
																"dt": 0.10551280456700678
															}
														},
														{
															"time": 1,
															"value": 0.004242424242424214,
															"mode": 0,
															"prevHandle": {
																"dv": 0.03333333333333333,
																"dt": -0.51
															},
															"nextHandle": {
																"dv": -0.02178544542538359,
																"dt": 0.33331731500836026
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.5,
												"scaleY": 0.5,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": -0.01
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
												"power": 1
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.009999999999999995,
											"value": -0.02419093677588713,
											"mode": 0,
											"prevHandle": {
												"dv": -0.6101554739171128,
												"dt": -0.33018814592265844
											},
											"nextHandle": {
												"dv": 0.9136438538946278,
												"dt": 0.49018439845683004
											}
										},
										{
											"time": 1,
											"value": 1.29108698853561,
											"mode": 0,
											"prevHandle": {
												"dv": -0.11323294039229448,
												"dt": -0.39715416696622907
											},
											"nextHandle": {
												"dv": 0.09487993739524597,
												"dt": 0.33286343471616847
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
								"amount": 0.8,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				},
				{
					"type": "emitter",
					"name": "Distort",
					"props": {
						"instScale_rand": 0,
						"maxCount": 50,
						"simulationSpace": "World",
						"animationSpeed": 0.2,
						"randomColor1": [
							1,
							1,
							1,
							1
						],
						"randomColor2": [
							0.9098039215686274,
							0.615686274509804,
							1,
							0.8509803921568627
						],
						"emitRate": 10,
						"instRotation_rand": [
							0,
							0,
							0
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
						"lifeTime": 0.8,
						"emitType": "Burst",
						"burstDelay": 0.1,
						"instScale": 6,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"animationLoop": false,
						"warmUpTime": 0.2,
						"instRotation": [
							-10,
							0,
							0
						]
					},
					"x": 1.37557,
					"y": -0.2251,
					"z": 1.98298,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"rotationX": -14.5,
					"rotationZ": 90,
					"children": [
						{
							"type": "model",
							"name": "Ring",
							"source": "Fx/Meshes_Common/Disk_StraightUVs.fbx",
							"scaleX": 0.15,
							"scaleY": 0.15,
							"scaleZ": 1.4,
							"rotationX": 90,
							"rotationY": 90,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "Distortion",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"culling": "Back"
										}
									},
									"diffuseMap": "Fx/noise/causticTexture_03-2.png"
								},
								{
									"type": "shader",
									"name": "DistortionMap",
									"source": "shaders/DistortionMap.hx",
									"props": {
										"distortionDir": "Fx/DistortionMaps/waveNormal02.jpg",
										"intensity": 0.02
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.8043636363636364,
													"mode": 0,
													"prevHandle": {
														"dv": 1.1438836500205134,
														"dt": -0.4763721338556696
													},
													"nextHandle": {
														"dv": -0.2551111111111112,
														"dt": 0.10551280456700678
													}
												},
												{
													"time": 1,
													"value": 0.004242424242424214,
													"mode": 0,
													"prevHandle": {
														"dv": 0.03333333333333333,
														"dt": -0.51
													},
													"nextHandle": {
														"dv": -0.02178544542538359,
														"dt": 0.33331731500836026
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": -0.01
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
										"power": 1
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.009999999999999995,
									"value": -0.02419093677588713,
									"mode": 0,
									"prevHandle": {
										"dv": -0.6101554739171128,
										"dt": -0.33018814592265844
									},
									"nextHandle": {
										"dv": 0.9136438538946278,
										"dt": 0.49018439845683004
									}
								},
								{
									"time": 1,
									"value": 1.29108698853561,
									"mode": 0,
									"prevHandle": {
										"dv": -0.11323294039229448,
										"dt": -0.39715416696622907
									},
									"nextHandle": {
										"dv": 0.09487993739524597,
										"dt": 0.33286343471616847
									}
								}
							]
						}
					]
				},
				{
					"type": "polygon",
					"name": "Back_Sand_Stylised",
					"x": -1.78167,
					"y": -0.09437,
					"z": 0.30332,
					"scaleX": 2.5,
					"scaleY": 3,
					"scaleZ": 0.1,
					"rotationX": -12.7,
					"rotationZ": -90,
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
									"depthTest": "LessEqual",
									"colorMask": 15,
									"enableStencil": false,
									"alphaKill": false,
									"parallax": 0,
									"textureWrap": true,
									"emissive": 0.3,
									"drawOrder": "100"
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
								"alpha": 0.5,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Alphas/T_FlatSmoke.png"
							}
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": false,
								"wrap": true,
								"progress": 0.5,
								"saturation": 0.5,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 2,
								"texture": "Fx/noise/T_Noise_Grunge_01.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									1
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
									"keyMode": 1,
									"keys": [
										{
											"time": 0.010370119822719112,
											"value": 0.8948601617813111,
											"mode": 1,
											"prevHandle": {
												"dv": -0.22616915345191968,
												"dt": -0.039999999999999925
											},
											"nextHandle": {
												"dv": -0.5337762368520101,
												"dt": 0.42926778498909995
											}
										},
										{
											"time": 0.6702337844157357,
											"value": 0,
											"mode": 2
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
								"envBlend": 0.5,
								"envColorSet": false
							}
						},
						{
							"type": "curve",
							"name": "position.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.14425550104449059,
									"value": 0.1,
									"mode": 0,
									"prevHandle": {
										"dv": 3.191729345188174,
										"dt": -0.2891727408212719
									},
									"nextHandle": {
										"dv": -3.191729345188174,
										"dt": 0.2891727408212719
									}
								},
								{
									"time": 1.18664882627114,
									"value": -2,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.08687605194944559,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -3.216730645116172,
										"dt": -0.5298503198629724
									},
									"nextHandle": {
										"dv": 0.9,
										"dt": 0.14824532747268693
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Back_Sand",
					"props": {
						"instScale_rand": 1,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.9803921568627451,
							0.9254901960784314,
							0.8980392156862745,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							30
						],
						"lifeTimeRand": 0.9,
						"useRandomColor": true,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 2,
						"emitAngle": 10,
						"alignMode": "Screen",
						"lifeTime": 6,
						"emitRad1": 0.64,
						"emitRad2": 0.89,
						"randomColor2": [
							0.7490196078431373,
							0.6705882352941176,
							0.6313725490196078,
							1
						],
						"instSpeed_rand": [
							1.5,
							0,
							0
						],
						"instAcceleration_rand": [
							0,
							0,
							0
						],
						"emitRate": 1,
						"speedFactor": 2.5,
						"maxCount": 3,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
						"emitType": "Burst",
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"instSpeed": [
							5,
							0,
							0
						],
						"burstParticleCount": 3
					},
					"x": -0.26805,
					"y": 0.28753,
					"z": 0.30332,
					"scaleX": 0.5,
					"scaleY": 2,
					"scaleZ": 0.1,
					"rotationZ": 180,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleX": 2.25,
							"scaleY": 2.25,
							"scaleZ": 2.25,
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
										"scale": 0.5
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.5
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
														"dv": -1.6472728746925278,
														"dt": -0.012445056058803479
													},
													"nextHandle": {
														"dv": 0.9454545454545454,
														"dt": 0.007142857142857143
													}
												},
												{
													"time": 0.45,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 8.922912650454184e-17,
														"dt": -0.21499999999999997
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.36
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01694444444444443,
														"dt": -0.27
													},
													"nextHandle": {
														"dv": 0.013434004892663146,
														"dt": 0.21406315992899264
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
											0.8745098039215686,
											0.8745098039215686
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
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.07,
											-0.05
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
													"value": 0.85,
													"mode": 0,
													"prevHandle": {
														"dv": 1.1116321015082125,
														"dt": -0.3076091494743911
													},
													"nextHandle": {
														"dv": -1,
														"dt": 0.2774350174349862
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
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1.7,
										"power": 0.8
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.57,
									"dirIntensity": 0.5,
									"dirSpan": 0.9,
									"sandBlend": 0.6,
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
									"value": 0.6,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0967980860793232,
										"dt": -0.009802037467223067
									},
									"nextHandle": {
										"dv": 0.5569361461292616,
										"dt": 0.0049999999999999975
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": 0.010970089074337164,
										"dt": -0.575
									},
									"nextHandle": {
										"dv": -0.006359231507065358,
										"dt": 0.3333207316535249
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
									"mode": 0,
									"prevHandle": {
										"dv": 2.9295995491315057,
										"dt": -0.31584745139074033
									},
									"nextHandle": {
										"dv": -1.0666666666666667,
										"dt": 0.115
									}
								},
								{
									"time": 0.6549999999999999,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.4399999999999999
									},
									"nextHandle": {
										"dv": -4.921775664347038e-16,
										"dt": 0.6028402231288772
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