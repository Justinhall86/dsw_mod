{
	"type": "fx",
	"duration": 3,
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
			"scaleX": 0.91,
			"scaleY": 0.91,
			"scaleZ": 0.91,
			"children": [
				{
					"type": "object",
					"name": "Chara",
					"editorOnly": true,
					"y": -1.0092936587501423e-17,
					"children": [
						{
							"type": "model",
							"name": "Male01_HarkonnenRabban",
							"source": "Character/Ecaz/Unit/WhitmoreBludd/Male01_WhitmoreBludd.fbx",
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Duncan/Anim_Male01_AltDuncan_AttackMelee01.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Atreide_Sword_01",
							"source": "Character/Ecaz/Weapon/SwordWhitmore/SwordWhitmore.fbx",
							"y": -0.28272,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": -90,
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 0.65,
										"color": [
											1,
											1,
											1
										]
									}
								}
							]
						},
						{
							"type": "model",
							"name": "Atreide_Sword_02",
							"source": "Character/Ecaz/Weapon/SwordWhitmore/SwordWhitmore.fbx",
							"x": -0.07328,
							"y": -0.02477,
							"z": 0.34657,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": 180
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Chara.Atreide_Sword_01",
							"target": "FXAnimation.FXRoot.Chara.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Chara.Atreide_Sword_02",
							"target": "FXAnimation.FXRoot.Chara.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_lPalmJ.B_lFinger1J1"
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"enabled": false,
							"props": {
								"amount": 1,
								"color": [
									0,
									0,
									0
								]
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Slash",
					"x": 2.31899,
					"y": -0.27319,
					"z": 3.14225,
					"scaleX": 1.15,
					"scaleY": 1.15,
					"scaleZ": 1.15,
					"children": [
						{
							"type": "polygon",
							"name": "SlashBeforeStraight",
							"x": -0.11682,
							"y": 0.73717,
							"z": 0.38561,
							"scaleX": 4,
							"scaleY": 3.9999999999999996,
							"scaleZ": 4,
							"rotationX": 143.4,
							"rotationY": -8.8,
							"rotationZ": 32.39999999999999,
							"kind": 1,
							"args": [
								24,
								360,
								0.9,
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
											"colorMask": 255,
											"emissive": 1
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.335128725685689,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.7755575615628914e-16,
														"dt": -0.720273286813528
													},
													"nextHandle": {
														"dv": -1.717718080690268e-16,
														"dt": 0.1532720149674032
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
										"scaleY": 1,
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
													"time": 0.0052511349082277475,
													"value": -2.425986213684083,
													"mode": 0,
													"prevHandle": {
														"dv": -4.2905226400401055,
														"dt": -0.39756112643888836
													},
													"nextHandle": {
														"dv": 2.254966461593016,
														"dt": 0.20723619543962724
													}
												},
												{
													"time": 1.1801727618162332,
													"value": -0.07079902046471076,
													"mode": 0,
													"prevHandle": {
														"dv": 0.10022073162635614,
														"dt": -1.0278901750669371
													},
													"nextHandle": {
														"dv": -0.03236836779593402,
														"dt": 0.33169812692914263
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
													"time": -0.12215068643081772,
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
													"time": 0.6978265999137031,
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
											0.4588235294117647,
											0.15294117647058825,
											0.24705882352941178
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
											1,
											1,
											1
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
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad_inv.png",
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
													"time": 0.4876592488785752,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.5775462962962963,
														"dt": 0.24189056417047677
													}
												},
												{
													"time": 1.3150621450801387,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666607,
														"dt": -0.5939735874966533
													},
													"nextHandle": {
														"dv": 0.004300720265366772,
														"dt": 0.15327085469037743
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "progress",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0.4876592488785752,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.4716628086419753,
														"dt": 0.26474741249451533
													}
												},
												{
													"time": 1.3150621450801387,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.009085648148148162,
														"dt": -0.22627155997527115
													},
													"nextHandle": {
														"dv": 0.006529111053095087,
														"dt": 0.15327794711050705
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "SlashThinok",
							"x": -0.11682,
							"y": 0.73717,
							"z": 0.38561,
							"scaleX": 4,
							"scaleY": 3.9999999999999996,
							"scaleZ": 4,
							"rotationX": 143.4,
							"rotationY": -8.8,
							"rotationZ": 32.39999999999999,
							"kind": 1,
							"args": [
								24,
								360,
								0.8,
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
											"colorMask": 255,
											"emissive": 5,
											"drawOrder": "100"
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
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
													"time": 0.22325469712090862,
													"value": -2.425986213684083,
													"mode": 2
												},
												{
													"time": 1.131457045959653,
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
													"time": 0.1303960830617601,
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
													"time": 0.5318241879826728,
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
													"time": 1.2641058602125552,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.04715950531536345,
														"dt": -0.6125145314162203
													},
													"nextHandle": {
														"dv": -0.04715950531536345,
														"dt": 0.6125145314162203
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
											0.4588235294117647,
											0.15294117647058825,
											0.24705882352941178
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "Slashtrail",
							"x": -0.5439319999999999,
							"y": 0.31128200000000006,
							"z": -0.09832200000000002,
							"scaleX": 3.4999999999999996,
							"scaleY": 3.5,
							"scaleZ": 3.5,
							"rotationX": 138.7,
							"rotationY": -11.200000000000003,
							"rotationZ": 34.20000000000002,
							"kind": 1,
							"args": [
								24,
								289.09,
								0.36,
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
											"colorMask": 255,
											"emissive": 4
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_2_blurry.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 5
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 0.5574534161490684,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5674534161490684,
													"value": 5,
													"mode": 2
												}
											]
										}
									]
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.6,
										"scaleY": 1,
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
											"keys": [
												{
													"time": 0.32928277058082556,
													"value": -3.1941847453905066,
													"mode": 2
												},
												{
													"time": 0.6112754547753724,
													"value": 0.18393668231341698,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "scaleX",
											"keys": [
												{
													"time": 0.6219431078501598,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.7741170208936381,
													"value": 3.9797345995903033,
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
										"progress": 0.18,
										"saturation": 1,
										"width": 0.44,
										"uvScaleX": 1,
										"uvScaleY": 4,
										"texture": "Fx/Gradients/uGrad_uneaven.png",
										"uvShift": [
											0.1,
											0.5
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
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0.1303960830617601,
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
													"time": 0.5318241879826728,
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
													"time": 1.2641058602125552,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.04715950531536345,
														"dt": -0.6125145314162203
													},
													"nextHandle": {
														"dv": -0.04715950531536345,
														"dt": 0.6125145314162203
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
											0.2980392156862745,
											0.2784313725490196,
											0.27058823529411763
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "Slashtrail",
							"x": -0.87025,
							"y": 0.42017,
							"z": 0.18973,
							"scaleX": 4.500000000000002,
							"scaleY": 4.500000000000001,
							"scaleZ": 4.500000000000002,
							"rotationX": 124.7,
							"rotationY": 5.3,
							"rotationZ": 83.1,
							"kind": 1,
							"args": [
								24,
								289.09,
								0.36,
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
											"colorMask": 255,
											"emissive": 4
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_2_blurry.png"
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
													"time": 0.5922856387411196,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6022856387411196,
													"value": 5,
													"mode": 2
												},
												{
													"time": 0.7901126711092711,
													"value": 5,
													"mode": 2
												},
												{
													"time": 0.858774530065382,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
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
										"alpha": 2,
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.6,
										"scaleY": 1,
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
													"time": 0.41370411353006775,
													"value": -1.3362179601533486,
													"mode": 2
												},
												{
													"time": 0.6956967977246146,
													"value": -0.04,
													"mode": 0,
													"prevHandle": {
														"dv": 0.03242656333809013,
														"dt": -0.184046110159571
													},
													"nextHandle": {
														"dv": -0.03242656333809013,
														"dt": 0.184046110159571
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scaleX",
											"keys": [
												{
													"time": 0.6624497302118375,
													"value": 3.3760328744120853,
													"mode": 2
												},
												{
													"time": 0.8146236432553158,
													"value": 26.15980177681118,
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
										"progress": 0.18,
										"saturation": 1,
										"width": 0.44,
										"uvScaleX": 1,
										"uvScaleY": 4,
										"texture": "Fx/Gradients/uGrad_uneaven.png",
										"uvShift": [
											0.1,
											0.5
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
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.2980392156862745,
											0.2784313725490196,
											0.27058823529411763
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0,
										"sandColorSet": false,
										"envBlend": 0.8,
										"envColorSet": false
									}
								}
							]
						},
						{
							"type": "object",
							"name": "flare",
							"enabled": false,
							"x": 3.096568,
							"y": -0.47429800000000005,
							"z": 2.4693579999999997,
							"scaleX": 0.49999999999999994,
							"scaleY": 0.49999999999999994,
							"scaleZ": 0.49999999999999994,
							"children": [
								{
									"type": "emitter",
									"name": "emitter_FlareBlack",
									"props": {
										"lifeTime": 0.35,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"burstDelay": 0.5,
										"instScale": 2,
										"instStretch": [
											15,
											6,
											1
										],
										"instRotation_rand": [
											0,
											0,
											80
										],
										"instStretch_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0,
										"useRandomColor": true,
										"randomColor1": [
											0.48627450980392156,
											0.48627450980392156,
											0.48627450980392156,
											1
										],
										"emitType": "Burst",
										"warmUpTime": -0.5,
										"instRotation": [
											0,
											0,
											90
										]
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"rotationX": 45,
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
															"emissive": 5
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
														"texture": "Fx/Alphas/T_Flare06_512.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.17254901960784313,
															0.08627450980392157,
															0.11372549019607843
														]
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
															0.17254901960784313,
															0.08627450980392157,
															0.11372549019607843
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
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
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
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_Flare",
									"enabled": false,
									"props": {
										"lifeTime": 0.2,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"burstDelay": 0.45,
										"instStretch": [
											50,
											4,
											1
										],
										"instRotation_rand": [
											0,
											0,
											80
										],
										"instStretch_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0,
										"useRandomColor": true,
										"randomColor1": [
											0.48627450980392156,
											0.48627450980392156,
											0.48627450980392156,
											1
										],
										"warmUpTime": -0.55,
										"emitType": "Burst",
										"instScale": 1.25,
										"instRotation": [
											0,
											0,
											90
										],
										"burstParticleCount": 2
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"rotationX": 45,
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
															"emissive": 6,
															"drawOrder": "100"
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
														"texture": "Fx/Alphas/T_Flare06_512.png"
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
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.06196351517869349,
																		"dt": -0.49990757001492336
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666672,
																		"dt": 0.13446288206139395
																	}
																},
																{
																	"time": 0.18100772585187647,
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
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
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
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "flareFloor",
							"enabled": false,
							"x": -4.17278,
							"y": 2.39518,
							"z": -3.14225,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "emitter",
									"name": "emitter_Flare",
									"props": {
										"lifeTime": 0.2,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"burstDelay": 0.45,
										"instStretch": [
											50,
											4,
											1
										],
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0,
										"useRandomColor": true,
										"randomColor1": [
											0.48627450980392156,
											0.48627450980392156,
											0.48627450980392156,
											1
										],
										"warmUpTime": -0.625,
										"emitType": "Burst",
										"instScale": 1.25,
										"instRotation": [
											0,
											0,
											30
										]
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"rotationX": 45,
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
															"emissive": 6,
															"drawOrder": "100"
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
														"texture": "Fx/Alphas/T_Flare06_512.png"
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
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.06196351517869349,
																		"dt": -0.49990757001492336
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666672,
																		"dt": 0.13446288206139395
																	}
																},
																{
																	"time": 0.18100772585187647,
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
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
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
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "SlashDistort",
							"enabled": false,
							"x": -0.11682199999999998,
							"y": 0.123182,
							"z": 0.38560799999999995,
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 5,
							"rotationX": 143.4,
							"rotationY": -8.8,
							"rotationZ": 32.39999999999999,
							"kind": 1,
							"args": [
								24,
								360,
								0.7,
								4
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
											"culling": "None",
											"colorMask": 255,
											"emissive": 25,
											"drawOrder": "100"
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1.5,
										"scaleY": 1,
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
													"time": 0.22325469712090862,
													"value": -2.425986213684083,
													"mode": 2
												},
												{
													"time": 1.131457045959653,
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
													"time": 0.1303960830617601,
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
													"time": 0.5318241879826728,
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
													"time": 1.2641058602125552,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.04715950531536345,
														"dt": -0.6125145314162203
													},
													"nextHandle": {
														"dv": -0.04715950531536345,
														"dt": 0.6125145314162203
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
											0.4588235294117647,
											0.15294117647058825,
											0.24705882352941178
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "HIT_FLOOR",
					"enabled": false,
					"x": 8.21036,
					"y": 6.51544,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"rotationZ": -155.8,
					"children": [
						{
							"type": "object",
							"name": "FrontHit",
							"x": 4.80749,
							"y": 0.30632,
							"z": -0.23481,
							"scaleX": 1.25,
							"scaleY": 1.25,
							"scaleZ": 1.25,
							"rotationX": 0.2999999999999999,
							"rotationY": 10.2,
							"rotationZ": 1.1999999999999995,
							"children": [
								{
									"type": "model",
									"name": "Sand",
									"source": "Fx/Meshes_Common/HalfCylinder_BottomPiv.fbx",
									"x": -0.87018,
									"y": 0.16892,
									"z": -0.05371,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2.63,
									"rotationZ": -105.2,
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
												"alpha": 0.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_JetSand_01.png"
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
												"progress": 0.4,
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
													-0.25,
													0.25
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
															"time": 0.5061836826774708,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.5061836826774708,
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
															"time": 1.8107857535850087,
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
											"name": "scale.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5533413330182987,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.1350785933343468,
														"dt": -0.1698906225913934
													},
													"nextHandle": {
														"dv": 0.9763246708157084,
														"dt": 0.14377171310896975
													}
												},
												{
													"time": 1.9445910633195251,
													"value": 0.8743206007304851,
													"mode": 2
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
												"shiftSpeedY": 0
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
												"progress": 0.33,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/T_Square02.jpg",
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.72,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
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
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 2.5,
										"power": 0.8
									}
								}
							]
						},
						{
							"type": "object",
							"name": "Distort",
							"x": 1.39625,
							"y": 0.32984,
							"z": 0.1,
							"scaleX": 0.75,
							"scaleY": 0.2,
							"scaleZ": 0.5,
							"rotationX": 7.6,
							"rotationY": 90,
							"children": [
								{
									"type": "model",
									"name": "PlanePivBot_NoVrtx",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
									"scaleY": 4,
									"scaleZ": 7,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Distortion",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"texture": "Fx/Gradients/Cyl05v_A_Tapered.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.5,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": -1.124604999922227,
																"dt": 0.06682227758749892
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.027656293032379653,
																"dt": -0.28596902410700986
															},
															"nextHandle": {
																"dv": 0.027656293032379653,
																"dt": 0.28596902410700986
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/noise/causticTexture_02.png",
												"intensity": 0.15
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"keys": [
														{
															"time": 0.5054792162285735,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5054792162285735,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"keys": [
														{
															"time": 0.5054792162285735,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.9918114924484887,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.0065993129073667,
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
												"useScale": false,
												"wrap": true,
												"progress": 0.7,
												"saturation": 0,
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.5,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.7871018058682482,
																"dt": 0.06863200598878672
															}
														},
														{
															"time": 1,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016418796802560642,
																"dt": -0.40563803898909634
															},
															"nextHandle": {
																"dv": -0.007231640352717618,
																"dt": 0.16666332862669664
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
												"useScale": false,
												"wrap": true,
												"progress": 0.36,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl01u_A.jpg",
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
											"name": "scale.z",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.5,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.7871018058682482,
														"dt": 0.06863200598878672
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.016418796802560642,
														"dt": -0.40563803898909634
													},
													"nextHandle": {
														"dv": -0.007231640352717618,
														"dt": 0.16666332862669664
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"x": 3.941,
							"y": 1.31994,
							"z": 0.1,
							"scaleX": 1.8,
							"scaleY": 2.2,
							"scaleZ": 1.8,
							"rotationZ": -105.9,
							"kind": 1,
							"args": [
								24,
								256.36,
								0.95,
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
											"colorMask": 255,
											"emissive": 2
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
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_MissileHead.png"
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
										"progress": 0.28,
										"saturation": 0,
										"width": 0.83,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl05v_A01.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad.png",
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
													"time": 0.413795314637483,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.09625856167782959,
														"dt": -0.49997500187484384
													},
													"nextHandle": {
														"dv": -0.03333333333333333,
														"dt": 0.17313611491108072
													}
												},
												{
													"time": 0.6284840971272231,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 0.8778001025991794,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.1696733926128592
													},
													"nextHandle": {
														"dv": 0.016325680692641273,
														"dt": 0.08310100889504159
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
										"sandBlend": 0.6,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "HIT2_FLOOR",
					"enabled": false,
					"x": -0.9548,
					"y": -6.27172,
					"scaleX": 1.2,
					"scaleY": 1.5,
					"scaleZ": 1.5,
					"rotationZ": 59.1,
					"children": [
						{
							"type": "object",
							"name": "FrontHit",
							"x": 4.80749,
							"y": 0.30632,
							"z": -0.23481,
							"scaleX": 1.5,
							"scaleY": 1.25,
							"scaleZ": 1.25,
							"rotationX": 0.2999999999999999,
							"rotationY": 10.2,
							"rotationZ": 1.1999999999999995,
							"children": [
								{
									"type": "model",
									"name": "Sand",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
									"x": -0.01188,
									"y": -0.00091,
									"z": -0.29334,
									"scaleX": 3,
									"scaleY": 2.25,
									"scaleZ": 2.5,
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
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 0.5,
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
												"texture": "Fx/Alphas/T_JetSand_01.png"
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
												"progress": 0.4,
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
													-0.15,
													0.25
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
															"time": 1.4764873492444355,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 1.4764873492444355,
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
															"time": 2.7810894201519734,
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
											"name": "scale.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.5236449995852634,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.1350785933343468,
														"dt": -0.1698906225913934
													},
													"nextHandle": {
														"dv": 0.9763246708157084,
														"dt": 0.14377171310896975
													}
												},
												{
													"time": 2.91489472988649,
													"value": 0.8743206007304851,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.5236449995852634,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -1.1350785933343468,
														"dt": -0.1698906225913934
													},
													"nextHandle": {
														"dv": 0.9763246708157084,
														"dt": 0.14377171310896975
													}
												},
												{
													"time": 2.91489472988649,
													"value": 0.8743206007304851,
													"mode": 2
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
												"shiftSpeedY": 0
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1.5,
										"power": 0.8
									}
								}
							]
						},
						{
							"type": "object",
							"name": "Distort",
							"x": 1.37748,
							"y": 0.18916,
							"z": 0.1,
							"scaleY": 0.25,
							"rotationY": 89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "PlanePivBot_NoVrtx",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
									"y": 0.1374,
									"scaleY": 3.5,
									"scaleZ": 4.5,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Distortion",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"texture": "Fx/Gradients/Cyl05v_A_Tapered.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 1.5088884729396836,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": -1.124604999922227,
																"dt": 0.06682227758749892
															}
														},
														{
															"time": 2.0088884729396836,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.027656293032379653,
																"dt": -0.28596902410700986
															},
															"nextHandle": {
																"dv": 0.027656293032379653,
																"dt": 0.28596902410700986
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/noise/causticTexture_02.png",
												"intensity": 0.1
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"keys": [
														{
															"time": 1.5143676891682571,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.514367689168257,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"keys": [
														{
															"time": 1.5143676891682571,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.000699965388172,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.920642525803727,
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
												"useScale": false,
												"wrap": true,
												"progress": 0.7,
												"saturation": 0,
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
													"keyMode": 1,
													"keys": [
														{
															"time": 1.5088884729396836,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.7871018058682482,
																"dt": 0.06863200598878672
															}
														},
														{
															"time": 2.0088884729396836,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016418796802560642,
																"dt": -0.40563803898909634
															},
															"nextHandle": {
																"dv": -0.007231640352717618,
																"dt": 0.16666332862669664
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
												"useScale": false,
												"wrap": true,
												"progress": 0.36,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl01u_A.jpg",
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
											"name": "scale.z",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.5088884729396836,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.7871018058682482,
														"dt": 0.06863200598878672
													}
												},
												{
													"time": 2.0088884729396836,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.016418796802560642,
														"dt": -0.40563803898909634
													},
													"nextHandle": {
														"dv": -0.007231640352717618,
														"dt": 0.16666332862669664
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "FloorStraightImpact",
							"x": 1.37748,
							"y": 0.18916,
							"z": 0.1,
							"scaleY": 0.25,
							"rotationY": 89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "PlanePivBot_NoVrtx",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
									"z": 0.81007,
									"scaleY": 0.8,
									"scaleZ": 4,
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
													"emissive": 1
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_MissileHead.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 1.4709838646957758,
															"value": 0,
															"mode": 1
														},
														{
															"time": 1.4772733862585756,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": -1.124604999922227,
																"dt": 0.06682227758749892
															}
														},
														{
															"time": 1.9772733862585756,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.027656293032379653,
																"dt": -0.28596902410700986
															},
															"nextHandle": {
																"dv": 0.027656293032379653,
																"dt": 0.28596902410700986
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
												"useScale": false,
												"wrap": true,
												"progress": 0.3,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl01u_A.jpg",
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
												"envBlend": 0.5,
												"envColorSet": false
											}
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.482841539942084,
													"value": 0.2710450124806828,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.7871018058682482,
														"dt": 0.06863200598878672
													}
												},
												{
													"time": 1.9772733862585756,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.016418796802560642,
														"dt": -0.40563803898909634
													},
													"nextHandle": {
														"dv": -0.007231640352717618,
														"dt": 0.16666332862669664
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
					"type": "polygon",
					"name": "Slashtrail",
					"x": -0.42977,
					"y": 0.38887,
					"z": 2.44514,
					"scaleX": 3.4999999999999996,
					"scaleY": 3.5,
					"scaleZ": 3.5,
					"rotationX": -179.1,
					"rotationY": 25.9,
					"rotationZ": 36.2,
					"kind": 1,
					"args": [
						24,
						289.09,
						0.36,
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
									"colorMask": 255,
									"emissive": 4
								}
							},
							"diffuseMap": "Fx/Alphas/T_Slash_2_blurry.png"
						},
						{
							"type": "shader",
							"name": "AutoAlpha",
							"source": "shaders/AutoAlpha.hx",
							"props": {
								"scale": 5
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "scale",
									"keys": [
										{
											"time": 1.4679399881134452,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.4779399881134454,
											"value": 5,
											"mode": 2
										},
										{
											"time": 1.5824900028416968,
											"value": 5,
											"mode": 2
										},
										{
											"time": 1.680628917746608,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
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
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 0.6,
								"scaleY": 1,
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
									"keys": [
										{
											"time": 1.2535701274537057,
											"value": -0.82,
											"mode": 2
										},
										{
											"time": 1.5538661526610975,
											"value": -0.36,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "scaleX",
									"keys": [
										{
											"time": 1.5324296798145367,
											"value": 2,
											"mode": 2
										},
										{
											"time": 1.684603592858015,
											"value": 10.237397941946988,
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
								"progress": 0.18,
								"saturation": 1,
								"width": 0.44,
								"uvScaleX": 1,
								"uvScaleY": 4,
								"texture": "Fx/Gradients/uGrad_uneaven.png",
								"uvShift": [
									0.1,
									0.5
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
									"enabled": false,
									"keyMode": 1,
									"keys": [
										{
											"time": 0.1303960830617601,
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
											"time": 1.4423107599470497,
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
											"time": 1.165411986516915,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.04715950531536345,
												"dt": -0.6125145314162203
											},
											"nextHandle": {
												"dv": -0.04715950531536345,
												"dt": 0.6125145314162203
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
									0.2980392156862745,
									0.2784313725490196,
									0.27058823529411763
								]
							}
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": false
							}
						}
					]
				}
			]
		}
	]
}