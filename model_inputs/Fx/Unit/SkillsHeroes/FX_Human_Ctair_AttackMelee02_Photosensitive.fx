{
	"type": "fx",
	"duration": 3,
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
					"type": "object",
					"name": "Chara",
					"editorOnly": true,
					"y": -1.0092936587501423e-17,
					"children": [
						{
							"type": "model",
							"name": "male01_SmugglerBannerjee",
							"source": "Character/Vernius/Unit/Ctair/Male01_Ctair.fbx",
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Ctair/Anim_Male01_Ctair_AttackMelee02.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Atreide_Sword_01",
							"source": "Character/Vernius/Weapon/CtairSword/CtairSword.fbx",
							"y": 0.11864,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": 90,
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
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Chara.Atreide_Sword_01",
							"target": "FXAnimation.FXRoot.Chara.male01_SmugglerBannerjee.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						}
					]
				},
				{
					"type": "polygon",
					"name": "Hit",
					"enabled": false,
					"x": 8.29017,
					"y": 0.98741,
					"z": 3.57055,
					"scaleX": 3.67,
					"scaleY": 2.4600000000000004,
					"scaleZ": 0.7199999999999996,
					"rotationX": -10.2,
					"rotationY": -38,
					"rotationZ": 115.1,
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
									"emissive": 8
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
											"time": 0.5013082113013833,
											"value": 0.01416666666666666,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.5013082113013833,
											"value": 0.01416666666666666,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.5013082113013833,
											"value": 0.01416666666666666,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.5013082113013833,
											"value": 0.01416666666666666,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.5013082113013833,
											"value": 0.01416666666666666,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.5013082113013833,
											"value": 0.01416666666666666,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.5144344903123617,
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
											"time": 0.5666787159461756,
											"value": 0.9419580650329591,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.021790168214930777
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.5666787159461756,
											"value": 0.9419580650329591,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.5666787159461756,
											"value": 0.9419580650329591,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.5666787159461756,
											"value": 0.9419580650329591,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.5666787159461756,
											"value": 0.9419580650329591,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.5666787159461756,
											"value": 0.9419580650329591,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.579804994957154,
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
											"time": 0.6549016807145065,
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
												"color": 4284698838
											},
											{
												"position": 1,
												"color": -7839517
											}
										],
										"resolution": 64,
										"isVertical": false,
										"interpolation": "Linear",
										"colorMode": 0
									}
								}
							}
						},
						{
							"type": "curve",
							"name": "position.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.46002157678888317,
									"value": 0.1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.0020841860073189666
									}
								},
								{
									"time": 0.46002157678888317,
									"value": 0.1,
									"prevHandle": {
										"dv": 0,
										"dt": 0
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.0020841860073189666
									}
								},
								{
									"time": 0.46002157678888317,
									"value": 0.1,
									"prevHandle": {
										"dv": 0,
										"dt": 0
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.0020841860073189666
									}
								},
								{
									"time": 0.46002157678888317,
									"value": 0.1,
									"prevHandle": {
										"dv": 0,
										"dt": 0
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.0020841860073189666
									}
								},
								{
									"time": 0.46002157678888317,
									"value": 0.1,
									"prevHandle": {
										"dv": 0,
										"dt": 0
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.0020841860073189666
									}
								},
								{
									"time": 0.46002157678888317,
									"value": 0.1,
									"prevHandle": {
										"dv": 0,
										"dt": 0
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.0020841860073189666
									}
								},
								{
									"time": 0.4731478557998616,
									"value": 0.1,
									"prevHandle": {
										"dv": -5.502767253584771,
										"dt": -0.26675634348951927
									},
									"nextHandle": {
										"dv": 3.2552441908845062,
										"dt": 0.15560350847851545
									}
								},
								{
									"time": 0.9795450610711736,
									"value": 4,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "polygon",
					"name": "Back_Sand_Stylised",
					"x": 5.3,
					"y": 0.4,
					"z": 0.42899999999999994,
					"scaleX": 6.994564805843879,
					"scaleY": 7.868885406574366,
					"scaleZ": 0.047677442334802894,
					"rotationX": -16.4,
					"rotationY": -3.180554681463517e-15,
					"rotationZ": 89.99999999999997,
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
											"time": 0.0667055755024083,
											"value": 0.8948601617813111,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0015070143887638925
											}
										},
										{
											"time": 0.08072428053911201,
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
											"time": 0.9069264263413942,
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
									"time": 0.2005909567241802,
									"value": 0.1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.0015070143887638832
									}
								},
								{
									"time": 0.21460966176088392,
									"value": 0.1,
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
									"time": 1.2605104107163974,
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
									"time": 0.132261717851038,
									"value": 0,
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
									"time": 0.16653580134139387,
									"value": 0.30368433086838276,
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
									"time": 1.0355104107163982,
									"value": 0.8743206007304851,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Body",
					"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
					"enabled": false,
					"x": -1.02612,
					"y": 1.15196,
					"z": 2.43084,
					"scaleX": 2.2,
					"scaleY": 2.2,
					"scaleZ": 2.5000000000000004,
					"rotationX": 22.3,
					"rotationY": 89.9,
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
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": true,
								"onDecal": false,
								"wrap": false,
								"invert": false,
								"replace": false,
								"alpha": 2.27,
								"uScale": 1,
								"vScale": 1,
								"uOffset": -0.18,
								"vOffset": 0,
								"texture": "Fx/Gradients/T_Square03.jpg"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.016860329173670113,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.032396283194464935,
											"value": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.050279752395452515
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.041899793662877126
											}
										},
										{
											"time": 0.25227274272387046,
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
								"onDecal": false,
								"wrap": false,
								"invert": false,
								"replace": false,
								"alpha": 2,
								"uScale": 1,
								"vScale": 1,
								"uOffset": -0.08,
								"vOffset": 0,
								"texture": "Fx/Gradients/uGrad.png"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.016860329173670113,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.032396283194464935,
											"value": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.050279752395452515
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.041899793662877126
											}
										},
										{
											"time": 0.25227274272387046,
											"value": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.041899793662877126
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.041899793662877126
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
								"progress": 0.52,
								"saturation": 1,
								"width": 0.15,
								"uvScaleX": 0.14,
								"uvScaleY": 0.73,
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
								"scaleY": 2,
								"shiftX": 1,
								"shiftY": 1,
								"shiftSpeedX": 0,
								"shiftSpeedY": 0
							},
							"children": [
								{
									"type": "curve",
									"name": "shiftX",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.032396283194464935,
											"value": 0.05111111111111105,
											"prevHandle": {
												"dv": 4.082155997157844e-16,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.07999999999999996
											}
										},
										{
											"time": 0.1626651829754635,
											"value": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.10833333333333332
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.10833333333333332
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
								"progress": 0.79,
								"saturation": 1,
								"width": 0.12,
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
											"time": 0.1488798798167673,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9339008467603516,
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
								"range": 1.5,
								"power": 0.8
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
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.6588235294117647,
									0.6039215686274509,
									0.9921568627450981
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 0.032396283194464935,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.1060704906673944,
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
						"warmUpTime": -0.12,
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
						"burstCount": 2,
						"instSpeed": [
							20,
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
					"x": 4.48462,
					"y": 0.5582,
					"scaleX": 0.9999999999999999,
					"scaleY": 0.9999999999999999,
					"scaleZ": 0.009999999999999998,
					"rotationZ": -10.399999999999999,
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
													"prevHandle": {
														"dv": 1.1116321015082125,
														"dt": -0.3076091494743911
													},
													"nextHandle": {
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
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
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
					"type": "object",
					"name": "SLASH",
					"x": 4.04777,
					"y": 0.03204,
					"z": 2.72648,
					"scaleX": 1.75,
					"scaleY": 1.6,
					"scaleZ": 1.6,
					"rotationX": -139.4,
					"rotationY": -2.6,
					"rotationZ": -2.1,
					"children": [
						{
							"type": "polygon",
							"name": "Slash",
							"scaleX": 3.5,
							"scaleY": 3.5,
							"scaleZ": 3.5,
							"rotationX": 0.2,
							"rotationY": -0.1,
							"rotationZ": 50.6,
							"kind": 1,
							"args": [
								24,
								280,
								0.57,
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.1495489650320863,
													"value": -2.425986213684083,
													"prevHandle": {
														"dv": -1.1803902618828348,
														"dt": -0.47465505272181074
													},
													"nextHandle": {
														"dv": 0.9145786525067239,
														"dt": 0.36814327172597683
													}
												},
												{
													"time": 1.2674033407202832,
													"value": 1.067704238891602,
													"prevHandle": {
														"dv": -0.01829157305013407,
														"dt": -0.7229200815073025
													},
													"nextHandle": {
														"dv": 0.008386955341055453,
														"dt": 0.3316701041992479
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftX",
											"enabled": false,
											"keys": [
												{
													"time": 0.1495489650320863,
													"value": -2.425986213684083,
													"mode": 2
												},
												{
													"time": 1.2674033407202832,
													"value": 1.067704238891602,
													"prevHandle": {
														"dv": -0.10050764163102777,
														"dt": -0.6467262683139329
													},
													"nextHandle": {
														"dv": 0.055870662776599245,
														"dt": 0.33161554377353464
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftX",
											"keys": [
												{
													"time": 0.08844893298512455,
													"value": -2.425986213684083,
													"mode": 2
												},
												{
													"time": 1.2063033086733226,
													"value": 1.067704238891602,
													"prevHandle": {
														"dv": -0.10050764163102777,
														"dt": -0.6467262683139329
													},
													"nextHandle": {
														"dv": 0.055870662776599245,
														"dt": 0.33161554377353464
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
													"time": 0.14352455640720949,
													"value": 0,
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
													"time": 0.6181119639287325,
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
													"time": 1.4392817108237295,
													"value": 0,
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
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -246930531
													},
													{
														"position": 0.98828125,
														"color": -9879142
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.403921568627451,
											0.3058823529411765,
											0.8352941176470589
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "SlashBlack",
							"enabled": false,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"kind": 1,
							"args": [
								24,
								250,
								0.57,
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.1273972609881831,
													"value": -2.425986213684083,
													"mode": 2
												},
												{
													"time": 1.24525163667638,
													"value": 1.067704238891602,
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
										},
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.1495489650320863,
													"value": -2.425986213684083,
													"prevHandle": {
														"dv": -1.1803902618828348,
														"dt": -0.47465505272181074
													},
													"nextHandle": {
														"dv": 0.9145786525067239,
														"dt": 0.36814327172597683
													}
												},
												{
													"time": 1.2674033407202832,
													"value": 1.067704238891602,
													"prevHandle": {
														"dv": -0.01829157305013407,
														"dt": -0.7229200815073025
													},
													"nextHandle": {
														"dv": 0.008386955341055453,
														"dt": 0.3316701041992479
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
													"time": 0.12270000065490042,
													"value": 0,
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
													"time": 0.5662750225149599,
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
													"time": 1.3874447694099568,
													"value": 0,
													"prevHandle": {
														"dv": 0.010995608538952428,
														"dt": -0.6427923963018025
													},
													"nextHandle": {
														"dv": -0.010995608538952428,
														"dt": 0.6427923963018025
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
											0,
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0.35546875,
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
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.85,
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
					"x": 4.88891,
					"y": -0.23582,
					"z": 2.66759,
					"scaleX": 1.29,
					"scaleY": 0.64,
					"scaleZ": 1.63,
					"rotationX": 143.2,
					"rotationY": 0.7,
					"rotationZ": -17.6,
					"time": 0.085,
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
									"depthTest": "LessEqual"
								}
							},
							"color": [
								0.2784313725490196,
								0.2784313725490196,
								0.2784313725490196,
								1
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.5
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.44765986132511565,
											"value": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.05557829352850535
											}
										},
										{
											"time": 0.6143947419106317,
											"value": 1,
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
								"range": 2.27,
								"power": 3.79
							}
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
					"name": "Slashtrail",
					"x": 2.77446,
					"y": 0.83406,
					"z": 3.39743,
					"scaleX": 5,
					"scaleY": 5,
					"scaleZ": 5,
					"rotationX": -159.5,
					"rotationY": -33.3,
					"rotationZ": 52.5,
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
											"time": 0.5468275909661288,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5687977665106391,
											"value": 5,
											"mode": 2
										},
										{
											"time": 0.6733477812388906,
											"value": 5,
											"mode": 2
										},
										{
											"time": 0.7714866961438017,
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
											"time": 0.3444279058508997,
											"value": -0.82,
											"mode": 2
										},
										{
											"time": 0.6447239310582914,
											"value": -0.36,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "scaleX",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6232874582117305,
											"value": 2,
											"mode": 2
										},
										{
											"time": 0.7754613712552086,
											"value": 10.237397941946988,
											"prevHandle": {
												"dv": 0.04607249142477876,
												"dt": -0.10395312511489752
											},
											"nextHandle": {
												"dv": -0.2215857665773199,
												"dt": 0.49996282389674773
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
											"time": 0.035910526633530795,
											"value": 0,
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
											"time": 0.25225485268636444,
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
											"time": 0.2742250282308747,
											"value": 0,
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
									0.21568627450980393,
									0.13333333333333333,
									0.09411764705882353
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