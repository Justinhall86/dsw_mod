{
	"type": "fx",
	"duration": 2.5,
	"cullingRadius": 15,
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
					"type": "object",
					"name": "group",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Male01_HarkonnenRabban",
							"source": "Character/Atreide/Unit/Gurney/Male01_AtreidesGurney.fbx",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Gurney/Anim_Male01_Gurney_AttackMelee01.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Atreide_Sword_01",
							"source": "Character/Atreide/Unit/Weapons/GurneySet_Javelin.fbx",
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": -90
						},
						{
							"type": "model",
							"name": "Atreide_Sword_02",
							"source": "Character/Atreide/Unit/Weapons/GurneySet_Shield.fbx",
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": 90,
							"rotationY": 180,
							"rotationZ": 180
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.group.Atreide_Sword_01",
							"target": "FXAnimation.FXRoot.group.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon.B_Whip01J"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.group.Atreide_Sword_02",
							"target": "FXAnimation.FXRoot.group.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_Shield"
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_Unit_CommonSlash",
					"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
					"x": 0.91309,
					"y": 0.15562,
					"z": 2.54197,
					"scaleX": 1.33,
					"scaleY": 0.42,
					"scaleZ": 1.33,
					"rotationX": -91.4,
					"rotationY": 9,
					"rotationZ": 5,
					"time": -0.18,
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
									"depthTest": "LessEqual"
								}
							}
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1
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
								"progress": 0.58,
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
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "progress",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.2749999999999999,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.5295446777343757,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 1.1333333333333333,
												"dt": -1.191087646484375
											},
											"nextHandle": {
												"dv": -0.6172737074886301,
												"dt": 0.6499597739869252
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
								"progress": 0.65,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 2,
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
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 2.27,
								"power": 3.79
							}
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.42745098039215684,
									0.6392156862745098,
									0.403921568627451
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 1.0899999999999999,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 1.17,
											"value": 0.2,
											"mode": 2
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "polygon",
					"name": "Hit",
					"enabled": false,
					"x": 5.6311,
					"y": 0.41027,
					"z": 1.98611,
					"scaleX": 3.59,
					"scaleY": 2.1,
					"scaleZ": 0.52,
					"rotationX": 7.8,
					"rotationY": 13.3,
					"rotationZ": 91.2,
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
									"culling": "None",
									"depthTest": "LessEqual",
									"colorMask": 15,
									"enableStencil": false,
									"alphaKill": false,
									"parallax": 0,
									"textureWrap": true,
									"emissive": 5
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
								"progress": 0.5,
								"saturation": 0,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/noise/Wave_01.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
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
									"keyMode": 1,
									"keys": [
										{
											"time": 0.22044653060740516,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.22044653060740516,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.22044653060740516,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.22044653060740516,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.22044653060740516,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.22044653060740516,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.22044653060740516,
											"value": 0.01416666666666666,
											"mode": 1,
											"prevHandle": {
												"dv": 0.3775126578654911,
												"dt": -0.49657530216143814
											},
											"nextHandle": {
												"dv": 0.023114784558614043,
												"dt": 0.08500000000000008
											}
										},
										{
											"time": 0.2805167240647817,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.2805167240647817,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.2805167240647817,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.2805167240647817,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.2805167240647817,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.2805167240647817,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.2805167240647817,
											"value": 0.9419580650329591,
											"mode": 1,
											"prevHandle": {
												"dv": -0.22616915345191968,
												"dt": -0.039999999999999925
											},
											"nextHandle": {
												"dv": -0.6883794651925124,
												"dt": 0.022481199434944754
											}
										},
										{
											"time": 0.34952448935532177,
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
								"sandBlend": 0.8,
								"sandColorSet": false,
								"envBlend": 0.3,
								"envColorSet": false
							}
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 200,
								"power": 23.48
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
									0.6666666666666666,
									1,
									0.7686274509803921
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 0.43825538473783987,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 0.5033329212907862,
											"value": 0.2,
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
							"enabled": false,
							"props": {
								"amount": 1,
								"color": [
									1,
									0.13333333333333333,
									0
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.2645576373575681,
											"value": 0.9,
											"mode": 0,
											"prevHandle": {
												"dv": -0.8165024079564438,
												"dt": -0.49978387723217654
											},
											"nextHandle": {
												"dv": 0.033333333333333326,
												"dt": 0.02040344573643249
											}
										},
										{
											"time": 0.29482380320850987,
											"value": 0.5333333333333333,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0.18250746105537796,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.18250746105537796,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.18250746105537796,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.18250746105537796,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.18250746105537796,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.18250746105537796,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.18250746105537796,
									"value": 0.1,
									"mode": 0,
									"prevHandle": {
										"dv": -5.1929172557584735,
										"dt": -0.27727380087695946
									},
									"nextHandle": {
										"dv": 4.550322954356672,
										"dt": 0.24499999999999988
									}
								},
								{
									"time": 0.6599074195850512,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.6599074195850512,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.6599074195850512,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.6599074195850512,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.6599074195850512,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.6599074195850512,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.6599074195850512,
									"value": 5,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "polygon",
					"name": "Hit",
					"enabled": false,
					"x": 5.28968,
					"y": -1.37572,
					"z": 2.33207,
					"scaleX": 2.69,
					"scaleY": 2.5,
					"scaleZ": 0.52,
					"rotationX": 5.9,
					"rotationY": -53.6,
					"rotationZ": 92,
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
									"culling": "None",
									"depthTest": "LessEqual",
									"colorMask": 15,
									"enableStencil": false,
									"alphaKill": false,
									"parallax": 0,
									"textureWrap": true,
									"emissive": 5
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
								"progress": 0.5,
								"saturation": 0,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/noise/Wave_01.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
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
									"keyMode": 1,
									"keys": [
										{
											"time": 0.790446530607405,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.790446530607405,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.790446530607405,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.790446530607405,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.790446530607405,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.790446530607405,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.790446530607405,
											"value": 0.01416666666666666,
											"mode": 1,
											"prevHandle": {
												"dv": 0.3775126578654911,
												"dt": -0.49657530216143814
											},
											"nextHandle": {
												"dv": 0.023114784558614043,
												"dt": 0.08500000000000008
											}
										},
										{
											"time": 0.8505167240647815,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.8505167240647815,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.8505167240647815,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.8505167240647815,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.8505167240647815,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.8505167240647815,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.8505167240647815,
											"value": 0.9419580650329591,
											"mode": 1,
											"prevHandle": {
												"dv": -0.22616915345191968,
												"dt": -0.039999999999999925
											},
											"nextHandle": {
												"dv": -0.6883794651925124,
												"dt": 0.022481199434944754
											}
										},
										{
											"time": 0.9195244893553216,
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
								"sandBlend": 0.8,
								"sandColorSet": false,
								"envBlend": 0.3,
								"envColorSet": false
							}
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 200,
								"power": 23.48
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
									0.6666666666666666,
									1,
									0.7686274509803921
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 1.0082553847378397,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 1.073332921290786,
											"value": 0.2,
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
							"enabled": false,
							"props": {
								"amount": 1,
								"color": [
									1,
									0.13333333333333333,
									0
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.8345576373575679,
											"value": 0.9,
											"mode": 0,
											"prevHandle": {
												"dv": -0.8165024079564438,
												"dt": -0.49978387723217654
											},
											"nextHandle": {
												"dv": 0.033333333333333326,
												"dt": 0.02040344573643249
											}
										},
										{
											"time": 0.8648238032085097,
											"value": 0.5333333333333333,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0.7525074610553778,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.7525074610553778,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.7525074610553778,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.7525074610553778,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.7525074610553778,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.7525074610553778,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.7525074610553778,
									"value": 0.1,
									"mode": 0,
									"prevHandle": {
										"dv": -5.1929172557584735,
										"dt": -0.27727380087695946
									},
									"nextHandle": {
										"dv": 4.550322954356672,
										"dt": 0.24499999999999988
									}
								},
								{
									"time": 1.229907419585051,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.229907419585051,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.229907419585051,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.229907419585051,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.229907419585051,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.229907419585051,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.229907419585051,
									"value": 5,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Sand_Floor",
					"props": {
						"instScale_rand": 1,
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
						"emitRate": 1,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
						"instScale": 15,
						"emitType": "Burst",
						"instStretch_rand": [
							0,
							0,
							0
						],
						"burstParticleCount": 3,
						"emitShape": "Cylinder",
						"emitRad1": 0.83,
						"emitSurface": true,
						"lifeTimeRand": 0.3,
						"alignMode": "Screen",
						"warmUpTime": -0.2,
						"emitOrientation": "Normal",
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"seedGroup": 2,
						"lifeTime": 1.5,
						"burstDelay": 0.5,
						"instOffset_rand": [
							0,
							0,
							0
						],
						"instOffset": [
							0,
							0,
							2
						]
					},
					"x": 3.56494,
					"y": 0.30424,
					"z": 0.48991,
					"scaleZ": 0.01,
					"rotationZ": 43.6,
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
										"scale": 1
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
											0.9098039215686274,
											0.9098039215686274,
											0.9098039215686274
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
										"saturation": 0,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
										"range": 28.79,
										"power": 38.64
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"enabled": false,
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topIntensity": 0.4,
									"topSpan": 0.5,
									"dirIntensity": 0.5,
									"dirSpan": 0.9,
									"sandBlend": 0.7,
									"envBlend": 0.5
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
							"type": "curve",
							"name": "instScale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.5123015258138923,
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
									"time": 1,
									"value": 1.01469963255798,
									"mode": 0,
									"prevHandle": {
										"dv": -0.040734981627899014,
										"dt": -0.6732812499999992
									},
									"nextHandle": {
										"dv": 0.016048606913192237,
										"dt": 0.2659338296837626
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instSpeed.x",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 1.6195399014805467,
										"dt": 2.975046534659357e-17
									},
									"nextHandle": {
										"dv": -1.1333333333333333,
										"dt": 0
									}
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.016666666666666663,
										"dt": -0.98
									},
									"nextHandle": {
										"dv": -0.005668855987316409,
										"dt": 0.3333287320541929
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "HeatWave_Distort",
					"props": {
						"emitRate": 2,
						"useRandomColor": true,
						"randomColor1": [
							1,
							1,
							1,
							0.8313725490196078
						],
						"randomColor2": [
							0.9019607843137255,
							0.9019607843137255,
							0.9019607843137255,
							0.7294117647058823
						],
						"instScale": 13,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"instScale_rand": 0,
						"warmUpTime": -0.88,
						"emitType": "Burst",
						"lifeTime": 0.7,
						"alignMode": "Screen"
					},
					"x": 2.41892,
					"y": -0.24975,
					"z": 4.79594,
					"scaleX": 0.1,
					"scaleY": 0.1,
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
											"mode": "Distortion",
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
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.1072413710626145,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0058489084243771305,
														"dt": -0.06672153635116596
													},
													"nextHandle": {
														"dv": 0.0058489084243771305,
														"dt": 0.06672153635116596
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
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.8,
										"sandColorSet": false,
										"envBlend": 0.2,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											1,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "DistortionMap",
									"source": "shaders/DistortionMap.hx",
									"props": {
										"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
										"intensity": 0.08
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "emitRate",
							"keyMode": 1,
							"keys": [
								{
									"time": -0.008955438443594144,
									"value": 0,
									"mode": 0
								},
								{
									"time": 1.199261029354163,
									"value": 1,
									"mode": 1,
									"prevHandle": {
										"dv": -0.5333333333333333,
										"dt": -0.4725329589843752
									},
									"nextHandle": {
										"dv": 0.016666666666666607,
										"dt": 0.31836303710937575
									}
								},
								{
									"time": 3.140094610862653,
									"value": 0.9833333333333334,
									"mode": 0,
									"prevHandle": {
										"dv": 0.016666666666666607,
										"dt": -0.21809168368578025
									},
									"nextHandle": {
										"dv": -0.049836898730717664,
										"dt": 0.6521407892315909
									}
								},
								{
									"time": 5.952119635515775,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.5
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
									"value": 0.25000000000000006,
									"mode": 0,
									"prevHandle": {
										"dv": -0.9944446984687934,
										"dt": -0.48890120703870477
									},
									"nextHandle": {
										"dv": 0.7,
										"dt": 0.3425225781956737
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
					"name": "Hit",
					"enabled": false,
					"props": {
						"emitType": "Burst",
						"instScale_rand": 0,
						"instRotation_rand": [
							0,
							0,
							0
						],
						"warmUpTime": -0.3,
						"instRotation": [
							30,
							0,
							0
						],
						"instScale": 1.2
					},
					"x": 2.15195,
					"y": 0.04101,
					"z": 4.09555,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleX": 7,
							"scaleY": 7,
							"scaleZ": 7,
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
											"emissive": 10,
											"drawOrder": "120"
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
										"alpha": 0.17,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_FlatImpact.png"
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
										"progress": 0.47,
										"saturation": 0,
										"width": 0.28,
										"uvScaleX": 5,
										"uvScaleY": 5,
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.61,
													"value": 0.01416666666666666,
													"mode": 1,
													"prevHandle": {
														"dv": 0.3775126578654911,
														"dt": -0.49657530216143814
													},
													"nextHandle": {
														"dv": 0.023114784558614043,
														"dt": 0.08500000000000008
													}
												},
												{
													"time": 0.7050000000000001,
													"value": 0.9419580650329591,
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
													"time": 0.95,
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
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"enabled": false,
									"props": {
										"REVERSE": false,
										"range": 200,
										"power": 23.48
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
											0.6666666666666666,
											1,
											0.7686274509803921
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0.45,
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
								},
								{
									"type": "curve",
									"name": "position.x",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0.55,
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": -5.1929172557584735,
												"dt": -0.27727380087695946
											},
											"nextHandle": {
												"dv": 4.550322954356672,
												"dt": 0.24499999999999988
											}
										},
										{
											"time": 1.305,
											"value": 5,
											"mode": 2
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
										"dv": -0.03236093441864362,
										"dt": -0.49997643676805403
									},
									"nextHandle": {
										"dv": 0.03333333333333333,
										"dt": 0.5149999999999999
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
					"type": "model",
					"name": "GurneyShield",
					"source": "Fx/Meshes_Common/GurneyShield.fbx",
					"enabled": false,
					"x": 2.20681,
					"y": -0.14568,
					"z": 4.11321,
					"scaleX": 2.3,
					"scaleY": 2.3,
					"scaleZ": 2.2,
					"rotationX": 59.5,
					"rotationY": -166.8,
					"rotationZ": -16.9,
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
									"emissive": 10
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.13
							}
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.5529411764705883,
									1,
									0.5098039215686274
								]
							}
						},
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 0.945,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.99,
									"value": 1,
									"mode": 2
								},
								{
									"time": 1.095,
									"value": 0.016666666666666663,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": -0.0050000000000000044,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.94,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.9849999999999999,
									"value": 1.1194789073481342,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.01833333333333335
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.02166666666666665
									}
								},
								{
									"time": 1.055,
									"value": 1,
									"mode": 2
								},
								{
									"time": 1.565,
									"value": 1,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "GurneyShield",
					"source": "Fx/Meshes_Common/GurneyShield.fbx",
					"enabled": false,
					"x": 2.17039,
					"y": -0.15508,
					"z": 4.10889,
					"scaleX": 2.7,
					"scaleY": 2.7,
					"scaleZ": 2.58,
					"rotationX": 59.5,
					"rotationY": -166.8,
					"rotationZ": -16.9,
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
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.13
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 1,
									"keys": [
										{
											"time": -0.0050000000000000044,
											"value": 0.9666666666666667,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.9666666666666667,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.33499999999999996
											},
											"nextHandle": {
												"dv": -0.8,
												"dt": 0.050000000000000044
											}
										},
										{
											"time": 1.3,
											"value": -0.06666666666666667,
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
									0.6274509803921569,
									1,
									0.592156862745098
								]
							}
						},
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 0.9290909090909085,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.9912727272727273,
									"value": 1,
									"mode": 2
								},
								{
									"time": 1.685,
									"value": 0.016666666666666663,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": -0.0050000000000000044,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.94,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.9849999999999999,
									"value": 1.1194789073481342,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.01833333333333335
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.02166666666666665
									}
								},
								{
									"time": 1.055,
									"value": 1,
									"mode": 2
								},
								{
									"time": 1.565,
									"value": 1,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "polygon",
					"name": "Slash",
					"x": -1.04168,
					"y": -1.23822,
					"z": 4.18451,
					"scaleX": 7,
					"scaleY": 3.6,
					"scaleZ": 4.2,
					"rotationX": -120.3,
					"rotationY": 18.1,
					"rotationZ": 0.1,
					"kind": 1,
					"args": [
						23,
						166.36,
						0.48,
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
								"alpha": 1,
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
									0.42745098039215684,
									0.6392156862745098,
									0.403921568627451
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"enabled": false,
							"props": {
								"sandBlend": 0.7,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": true
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 1,
								"scaleY": 0.8,
								"shiftX": 1.5,
								"shiftY": 0,
								"shiftSpeedX": 0,
								"shiftSpeedY": 0
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "shiftX",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.47189638764372166,
											"value": -2.425986213684083,
											"mode": 2
										},
										{
											"time": 1.4922718818968175,
											"value": 1.067704238891602,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.5599999999999999
											},
											"nextHandle": {
												"dv": -9.460471999616726e-16,
												"dt": 0.3316719842180907
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
									1,
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
											"time": -0.10818588116757355,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.04818175693045633,
												"dt": -0.49954845585497076
											},
											"nextHandle": {
												"dv": -0.03472222222222221,
												"dt": 0.36
											}
										},
										{
											"time": 0.844333443046102,
											"value": 1.0416666666666667,
											"mode": 1,
											"prevHandle": {
												"dv": -0.9895833333333335,
												"dt": -0.04999999999999993
											},
											"nextHandle": {
												"dv": -1.0069444444444446,
												"dt": 0.05500000000000005
											}
										},
										{
											"time": 1.6249206961497198,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.1388888888888889,
												"dt": -0.615
											},
											"nextHandle": {
												"dv": -0.043250236625664115,
												"dt": 0.19151204777844172
											}
										}
									]
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
		}
	]
}