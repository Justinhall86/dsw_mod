{
	"type": "fx",
	"duration": 8,
	"cullingRadius": 30,
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
			"children": [
				{
					"type": "model",
					"name": "Male01_Idualis_Demo",
					"source": "Character/Idualis/Demo/Male01_Idualis_Demo.fbx",
					"editorOnly": true,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"time": -0.1,
							"animation": "Anim/Male01/Bolas/Anim_Male01_Bolas_AttackRange.fbx"
						}
					]
				},
				{
					"type": "model",
					"name": "Shoulder",
					"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
					"x": -1.84864,
					"y": -0.19457,
					"z": 3.52606,
					"scaleX": 0.25,
					"scaleY": 0.3,
					"scaleZ": 10,
					"rotationX": -85.8,
					"rotationY": 65.6,
					"rotationZ": -86.2,
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
									"emissive": 1
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
								"wrap": false,
								"invert": false,
								"replace": false,
								"alpha": 1,
								"uScale": 1,
								"vScale": 1,
								"uOffset": -0.18,
								"vOffset": 0,
								"texture": "Fx/Gradients/T_Square02.jpg"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 0.3050145647150331,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.7958566653187212,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.8267618806745368,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.934434811044333,
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
								"useSourceUVs": false,
								"useScale": true,
								"wrap": true,
								"progress": 0.4,
								"saturation": 1,
								"width": 0.11,
								"uvScaleX": 0.14,
								"uvScaleY": 0.28,
								"texture": "Fx/noise/Wave_01.jpg",
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
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 0.53,
								"scaleY": 1,
								"shiftX": 1,
								"shiftY": 1,
								"shiftSpeedX": 0,
								"shiftSpeedY": 0
							},
							"children": [
								{
									"type": "curve",
									"name": "shiftX",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0.7323139225501263,
											"value": 0.06666666666666667,
											"mode": 0,
											"prevHandle": {
												"dv": -0.808452083454443,
												"dt": -0.48507125007266594
											},
											"nextHandle": {
												"dv": 0.13333333333333336,
												"dt": 0.08000000000000007
											}
										},
										{
											"time": 0.9405929127360766,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.0667361233533,
											"value": 1.3,
											"mode": 0
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
								"progress": 0.79,
								"saturation": 1,
								"width": 0.11,
								"uvScaleX": 0.14,
								"uvScaleY": 1,
								"texture": "Fx/Gradients/T_Square03.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "width",
									"keys": [
										{
											"time": 0.8466888961420305,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.005168920246892,
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
								"range": 15.15,
								"power": 20
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
								"progress": 0.33,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 0.98,
								"uvScaleY": 2,
								"texture": "Fx/Gradients/uGrad.png",
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
							"type": "curve",
							"name": "scale.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.6939678821517089,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1.0098004965923308,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.10527753814687398
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.10527753814687398
									}
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
								"useScale": false,
								"wrap": true,
								"progress": 0.93,
								"saturation": 1,
								"width": 0.11,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Gradients/Cyl15u_A.png",
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
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.6,
								"sandColorSet": false,
								"envBlend": 0.4,
								"envColorSet": false
							}
						}
					]
				},
				{
					"type": "object",
					"name": "slashBolas",
					"x": -0.17168,
					"y": 1.30516,
					"z": 3.07054,
					"rotationX": 127.3,
					"rotationY": 7.016709298534877e-15,
					"rotationZ": -7.016709298534877e-15,
					"children": [
						{
							"type": "polygon",
							"name": "SlashFoot",
							"scaleX": 2.6,
							"scaleY": 2.6,
							"scaleZ": 2.6,
							"rotationZ": -91.92134831460672,
							"kind": 1,
							"args": [
								24,
								225,
								0.68,
								4
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
											"colorMask": 255
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
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
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square02.jpg",
										"onDecal": false
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
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad.png",
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.14359681329292873,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0.12898350993794783,
														"dt": -0.4998174849364267
													},
													"nextHandle": {
														"dv": 0.02907755692715791,
														"dt": 0.12119947235397059
													}
												},
												{
													"time": 0.3575896316679081,
													"value": 1.0416666666666667,
													"mode": 1,
													"prevHandle": {
														"dv": -0.9895833333333335,
														"dt": -0.04999999999999993
													},
													"nextHandle": {
														"dv": 0.01736111111111116,
														"dt": 0.10630843540074725
													}
												},
												{
													"time": 0.567513630850952,
													"value": 1.0416666666666667,
													"mode": 1
												},
												{
													"time": 0.8407202133543688,
													"value": 0,
													"mode": 1
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
										"sandBlend": 0.6,
										"sandColorSet": false,
										"envBlend": 0.4,
										"envColorSet": false
									}
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"keys": [
										{
											"time": 0.2,
											"value": 2.3,
											"mode": 2
										},
										{
											"time": 0.7846305881083238,
											"value": -0.385,
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
					"name": "GRENADE",
					"x": 4.4286,
					"z": 3.9538,
					"children": [
						{
							"type": "model",
							"name": "GrenadeMesh",
							"source": "Character/Idualis/Weapon/Bolas_Ball.fbx",
							"x": 0.01873,
							"y": -0.36604,
							"z": 0.12245,
							"scaleX": 0.025,
							"scaleY": 0.025,
							"scaleZ": 0.025,
							"rotationX": 132.9,
							"rotationY": 11.3,
							"rotationZ": 120.2,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "PBR",
											"blend": "Alpha",
											"shadows": true,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									}
								}
							]
						},
						{
							"type": "model",
							"name": "GrenadeMesh",
							"source": "Character/Idualis/Weapon/Bolas_Ball.fbx",
							"x": -0.46132,
							"y": 0.13284,
							"z": -0.15291,
							"scaleX": 0.025,
							"scaleY": 0.025,
							"scaleZ": 0.025,
							"rotationY": 105,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "PBR",
											"blend": "Alpha",
											"shadows": true,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"keys": [
								{
									"time": 0.8024242424242424,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1,
									"value": 19.00260151070507,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.7974453061460773,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.8074453061460773,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.9898705852170004,
									"value": 1,
									"mode": 2
								},
								{
									"time": 1.0048705852170006,
									"value": 0,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "LensFlare_color",
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
						"instScale": 5.5,
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
						"warmUpTime": -0.75,
						"instRotation": [
							0,
							0,
							-30
						],
						"lifeTime": 0.4
					},
					"x": 3.90929,
					"y": -0.20928,
					"z": 3.66625,
					"scaleX": 0.01,
					"scaleY": 0.01,
					"scaleZ": 0.01,
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
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"color": [
										0.9411764705882353,
										0.807843137254902,
										0.7058823529411764,
										1
									]
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
										"alpha": 0.8,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_LensFlare_05.png",
										"onDecal": false
									},
									"isInstance": true,
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
									]
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9921568627450981,
											0.8235294117647058,
											0.6627450980392157
										]
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
									"time": 0,
									"value": 0.3,
									"mode": 2
								},
								{
									"time": 1,
									"value": 1.1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.01283176810449338,
										"dt": -0.9272305319143821
									},
									"nextHandle": {
										"dv": 0.003205378105737736,
										"dt": 0.33333240186907614
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