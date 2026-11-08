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
							"source": "Character/Atreide/Unit/Duncan/Male01_AtreidesDuncan.fbx",
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Duncan/Anim_Male01_Duncan_AttackMelee01.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Atreide_Sword_01",
							"source": "Character/Atreide/Unit/Weapons/Atreide_Sword_01.fbx",
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": -90
						},
						{
							"type": "model",
							"name": "Atreide_Sword_02",
							"source": "Character/Atreide/Unit/Weapons/Atreide_Sword_01.fbx",
							"x": -0.04327,
							"y": -0.02477,
							"z": 0.1927,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": 180
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.group.Atreide_Sword_01",
							"target": "FXAnimation.FXRoot.group.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.group.Atreide_Sword_02",
							"target": "FXAnimation.FXRoot.group.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_lPalmJ.B_lFinger1J1"
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_Unit_CommonSlash",
					"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
					"x": 0.31329,
					"y": -0.41792,
					"z": 2.7105,
					"scaleZ": 0.45,
					"rotationX": -61.6,
					"rotationY": 8.2,
					"rotationZ": -12.9,
					"time": 0.06,
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
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.2545446777343758,
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
											"time": 0.815,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 0.8949999999999999,
											"value": 0.2,
											"mode": 2
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
					"type": "subFX",
					"name": "FX_Unit_CommonSlash",
					"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
					"x": 0.49358,
					"y": -0.41792,
					"z": 2.7105,
					"scaleZ": 0.45,
					"rotationX": -14.8,
					"rotationY": 15,
					"rotationZ": -2.9,
					"time": -0.03,
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
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9149999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.04386053085327124,
												"dt": -0.4783593749999998
											},
											"nextHandle": {
												"dv": -0.04386053085327124,
												"dt": 0.4783593749999998
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
											"time": 0.815,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 0.8949999999999999,
											"value": 0.2,
											"mode": 2
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
					"type": "subFX",
					"name": "FX_Unit_CommonSlash",
					"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
					"x": 2.46742,
					"y": -1.00012,
					"z": 2.94034,
					"scaleX": 1.55,
					"scaleZ": 0.83,
					"rotationX": 129.1,
					"rotationY": -0.6,
					"rotationZ": 43.2,
					"time": 0.515,
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
											"time": 0.5299999999999998,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7845446777343756,
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
											"time": 1.3449999999999998,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 1.4249999999999998,
											"value": 0.2,
											"mode": 2
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
					"type": "polygon",
					"name": "Hit",
					"enabled": false,
					"x": 4.39009,
					"y": -0.92074,
					"z": 2.03636,
					"scaleX": 3,
					"scaleY": 1.5,
					"scaleZ": 0.72,
					"rotationY": -4.7,
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
								"alpha": 0.5,
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
											"time": 0.40825071630890153,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.40825071630890153,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.40825071630890153,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.40825071630890153,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.40825071630890153,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.40825071630890153,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.40825071630890153,
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
											"time": 0.4490997444894025,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.4490997444894025,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.4490997444894025,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.4490997444894025,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.4490997444894025,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.4490997444894025,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.4490997444894025,
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
											"time": 0.49256893350134434,
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
											"time": 0.5484620644604808,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 0.5894555341800316,
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
											"time": 0.4390468387966435,
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
											"time": 0.45811202194671613,
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
									"time": 0.37310589519495513,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.37310589519495513,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.37310589519495513,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.37310589519495513,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.37310589519495513,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.37310589519495513,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.37310589519495513,
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
									"time": 0.6880845280642363,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.6880845280642363,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.6880845280642363,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.6880845280642363,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.6880845280642363,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.6880845280642363,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.6880845280642363,
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
					"x": 3.92763,
					"y": -0.67573,
					"z": 2.40095,
					"scaleX": 3,
					"scaleY": 1.5,
					"scaleZ": 0.72,
					"rotationY": 22.9,
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
								"alpha": 0.5,
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
											"time": 0.48418821630890085,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.48418821630890085,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.48418821630890085,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.48418821630890085,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.48418821630890085,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.48418821630890085,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.48418821630890085,
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
											"time": 0.5250372444894018,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.5250372444894018,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.5250372444894018,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.5250372444894018,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.5250372444894018,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.5250372444894018,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.5250372444894018,
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
											"time": 0.5685064335013437,
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
											"time": 0.6243995644604802,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 0.6653930341800309,
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
											"time": 0.5149843387966428,
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
											"time": 0.5340495219467154,
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
									"time": 0.44904339519495445,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.44904339519495445,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.44904339519495445,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.44904339519495445,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.44904339519495445,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.44904339519495445,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.44904339519495445,
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
									"time": 0.7640220280642356,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.7640220280642356,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.7640220280642356,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.7640220280642356,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.7640220280642356,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.7640220280642356,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.7640220280642356,
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
					"x": 7.13275,
					"y": 1.65692,
					"z": 2.50617,
					"scaleX": 3.67,
					"scaleY": 2.46,
					"scaleZ": 0.72,
					"rotationY": -1.3,
					"rotationZ": 98.7,
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
											"time": 0.907619432205117,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.907619432205117,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.907619432205117,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.907619432205117,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.907619432205117,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.907619432205117,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.907619432205117,
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
											"time": 0.9729899368499093,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.9729899368499093,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.9729899368499093,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.9729899368499093,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.9729899368499093,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.9729899368499093,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.9729899368499093,
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
											"time": 1.0480866226072618,
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
											"time": 1.1446467146411785,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 1.215466386772326,
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
											"time": 0.9556226954332356,
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
											"time": 0.9885594053298488,
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
									"time": 0.866332797692617,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.866332797692617,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.866332797692617,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.866332797692617,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.866332797692617,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.866332797692617,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.866332797692617,
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
									"time": 1.3858562819749083,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.3858562819749083,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.3858562819749083,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.3858562819749083,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.3858562819749083,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.3858562819749083,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.3858562819749083,
									"value": 5,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "polygon",
					"name": "Back_Sand_Stylised",
					"x": 6.62804,
					"y": -0.44956,
					"z": 1.21,
					"scaleX": 8,
					"scaleY": 9,
					"scaleZ": 0.0545308463451152,
					"rotationX": -16.4,
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
									"emissive": 0.3,
									"drawOrder": "110"
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
								"saturation": 0,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
											"time": 0.9108681666977188,
											"value": 0.8948601617813111,
											"mode": 1
										},
										{
											"time": 0.9108681666977188,
											"value": 0.8948601617813111,
											"mode": 1,
											"prevHandle": {
												"dv": -0.22616915345191968,
												"dt": -0.039999999999999925
											},
											"nextHandle": {
												"dv": -1.0614035807794995,
												"dt": 0.24955175517728168
											}
										},
										{
											"time": 1.7370703125000007,
											"value": 0.0002485722671614621,
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
								"sandBlend": 0.6,
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
									"time": 1.0447535479194903,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 1.0447535479194903,
									"value": 0.1,
									"mode": 0,
									"prevHandle": {
										"dv": -1.6141157995646966,
										"dt": -0.29141785020757316
									},
									"nextHandle": {
										"dv": 1.9087633109092725,
										"dt": 0.35074449895550963
									}
								},
								{
									"time": 2.0906542968750035,
									"value": 1.814904036521913,
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
									"time": 0.9624056040096447,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.010893013836548135
									}
								},
								{
									"time": 0.9966796875000005,
									"value": 0.30368433086838276,
									"mode": 0,
									"prevHandle": {
										"dv": -0.018726500684397046,
										"dt": -0.003303737957172996
									},
									"nextHandle": {
										"dv": 0.5269202398255781,
										"dt": 0.09254882812499987
									}
								},
								{
									"time": 1.8656542968750043,
									"value": 0.8743206007304851,
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
						"instScale": 20,
						"emitType": "Burst",
						"instStretch_rand": [
							0,
							0,
							0
						],
						"burstParticleCount": 2,
						"emitShape": "Cylinder",
						"emitRad1": 0.83,
						"emitSurface": true,
						"lifeTimeRand": 0.3,
						"alignMode": "Screen",
						"warmUpTime": -0.35,
						"emitOrientation": "Normal",
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"seedGroup": 2,
						"lifeTime": 1.5,
						"burstDelay": 0.1,
						"instOffset_rand": [
							0,
							0,
							0
						],
						"instOffset": [
							0,
							0,
							2
						],
						"burstCount": 2
					},
					"x": 2.36304,
					"y": -0.49999,
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
									"value": 0.2,
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
						"instScale": 20,
						"emitType": "Burst",
						"instStretch_rand": [
							0,
							0,
							0
						],
						"burstParticleCount": 2,
						"emitShape": "Cylinder",
						"emitRad1": 0.83,
						"emitSurface": true,
						"lifeTimeRand": 0.3,
						"alignMode": "Screen",
						"warmUpTime": -0.8,
						"emitOrientation": "Normal",
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"seedGroup": 2,
						"lifeTime": 1.5,
						"burstDelay": 0.1,
						"instOffset_rand": [
							0,
							0,
							0
						],
						"instOffset": [
							0,
							0,
							2
						],
						"burstCount": 2
					},
					"x": 4.81074,
					"y": -0.49999,
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
									"value": 0.2,
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
				}
			]
		}
	]
}