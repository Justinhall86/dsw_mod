{
	"type": "fx",
	"cullingRadius": 100,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
			"locked": true,
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
			"name": "FXRoot",
			"children": [
				{
					"type": "reference",
					"name": "Prefab_Arrakeen",
					"source": "Structure/Base/Arrakeen/Prefab_Arrakeen.prefab",
					"editorOnly": true,
					"locked": true,
					"z": -0.3
				},
				{
					"type": "object",
					"name": "Arrakeen_Invert_Slide_Retime",
					"rotationZ": 89.99999999999999,
					"children": [
						{
							"type": "model",
							"name": "Shield_Carthag",
							"source": "Fx/Meshes_Common/Shield_Arrakeen_StraightUV.fbx",
							"enabled": false,
							"x": -1.6733,
							"y": -0.26701,
							"scaleX": 0.95,
							"scaleY": 0.95,
							"scaleZ": 0.95,
							"rotationZ": -64.7,
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
											"emissive": 1
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.36,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/T_SpiceAlpha.png",
										"uvShift": [
											0.2,
											0.5
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap-Pattern",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.94,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 3,
										"texture": "Fx/Alphas/Hextile_hex02-Both.png",
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
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": false,
										"ALPHA": true,
										"REVERSE": false,
										"bias": 0,
										"scale": 1,
										"power": 1,
										"color": [
											1,
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
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 5,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Dissolve_ShieldBase01.png",
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
													"time": 0.11835690840227087,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0.32059068147914965,
														"dt": -0.4998246613718933
													},
													"nextHandle": {
														"dv": -0.050458527689237975,
														"dt": 0.271791203701135
													}
												},
												{
													"time": 0.8579584263526322,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -0.09959820801000036,
														"dt": -0.40686319584351727
													},
													"nextHandle": {
														"dv": 0.04878462835569844,
														"dt": 0.19928741889457519
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
											0.5490196078431373,
											1,
											0.7176470588235294
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1.5
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
													"time": 0.37723310945789335,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8355917906398725,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.050000000000000044,
														"dt": -0.4197689435407147
													},
													"nextHandle": {
														"dv": 0.009454142840255173,
														"dt": 0.07937111104274033
													}
												},
												{
													"time": 0.9044240447504295,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0.0105709577780226,
														"dt": -0.05433141901344351
													},
													"nextHandle": {
														"dv": -0.015000000000000069,
														"dt": 0.11742758129538333
													}
												},
												{
													"time": 1.0143562485163202,
													"value": 50,
													"mode": 2
												},
												{
													"time": 1.0243562485163202,
													"value": 0.5,
													"mode": 0
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Anticipation",
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Start",
									"x": -0.02687,
									"y": 0.07273,
									"scaleX": 58.5,
									"scaleY": 58.5,
									"scaleZ": 58.5,
									"rotationZ": 114.9,
									"albedoMap": "Fx/Alphas/T_ArrakeenBorder.png",
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 1,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.008322949484510006,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 3.651914045064065e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.10625000000000007,
																"dt": 0.3044293098446826
															}
														},
														{
															"time": 0.25710300252282536,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5700905660579207,
															"value": 0.011458333333333404,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021875000000000033,
																"dt": -0.3814535930583975
															},
															"nextHandle": {
																"dv": 0.008786986968611759,
																"dt": 0.15322641148956903
															}
														},
														{
															"time": 0.9026751256090497,
															"value": 0.011458333333333404,
															"mode": 0,
															"prevHandle": {
																"dv": -0.014976875997216066,
																"dt": -0.14224713341297948
															},
															"nextHandle": {
																"dv": 0.014976875997216066,
																"dt": 0.14224713341297948
															}
														},
														{
															"time": 1.0127751256090496,
															"value": 1.5,
															"mode": 1
														},
														{
															"time": 1.4657489068484388,
															"value": 0.011458333333333404,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.1373333333333333
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1373333333333333
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
													0.10980392156862745,
													0.5686274509803921,
													0.2823529411764706
												]
											}
										}
									]
								},
								{
									"type": "model",
									"name": "Shield_Carthag_grow",
									"source": "Fx/Meshes_Common/Shield_Arrakeen_StraightUV.fbx",
									"x": -1.6733,
									"y": -0.26701,
									"scaleX": 0.95,
									"scaleY": 0.95,
									"scaleZ": 0.95,
									"rotationZ": -64.7,
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
												"alpha": 0.75
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.0209060740793963,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.014545454545454528
															}
														},
														{
															"time": 1.7936581045877837,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.050000000000000044,
																"dt": -0.4197689435407147
															},
															"nextHandle": {
																"dv": 0.009454142840255173,
																"dt": 0.07937111104274033
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
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.6,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": false,
												"bias": 0,
												"scale": 1,
												"power": 1,
												"color": [
													1,
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 5,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Dissolve_ShieldBase01.png",
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
															"time": 0.8216151183622984,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0.32059068147914965,
																"dt": -0.4998246613718933
															},
															"nextHandle": {
																"dv": -0.050458527689237975,
																"dt": 0.271791203701135
															}
														},
														{
															"time": 1.4877418979586272,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": -0.09959820801000036,
																"dt": -0.40686319584351727
															},
															"nextHandle": {
																"dv": 0.04878462835569844,
																"dt": 0.19928741889457519
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap-Pattern",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.94,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1.75,
												"uvScaleY": 2,
												"texture": "Fx/Alphas/Hextile_hex02-Both.png",
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
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.011892807301293,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.014545454545454528
													}
												},
												{
													"time": 1.481368587447015,
													"value": 1.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.07920085175008922
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.07920085175008922
													}
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
													0.5490196078431373,
													1,
													0.7176470588235294
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
													0.7019607843137254,
													0.8,
													1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 1,
													"keys": [
														{
															"time": 1.011892807301293,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.18215281747879153,
																"dt": 0.23933963714967432
															}
														},
														{
															"time": 1.669157363846394,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.19376492688846592,
																"dt": -0.27474906754282835
															},
															"nextHandle": {
																"dv": 0.19376492688846592,
																"dt": 0.27474906754282835
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Shield_Carthag_lightstart",
									"source": "Fx/Meshes_Common/Shield_Arrakeen_StraightUV.fbx",
									"enabled": false,
									"x": -1.6733,
									"y": -0.26701,
									"scaleX": 0.95,
									"scaleY": 0.95,
									"scaleZ": 0.95,
									"rotationZ": -64.7,
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
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.6,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": false,
												"bias": 0,
												"scale": 1,
												"power": 1,
												"color": [
													1,
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 5,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Dissolve_ShieldBase01.png",
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
															"time": 0.11835690840227087,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0.32059068147914965,
																"dt": -0.4998246613718933
															},
															"nextHandle": {
																"dv": -0.050458527689237975,
																"dt": 0.271791203701135
															}
														},
														{
															"time": 1.010471833760835,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": -0.09959820801000036,
																"dt": -0.40686319584351727
															},
															"nextHandle": {
																"dv": 0.04878462835569844,
																"dt": 0.19928741889457519
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
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.17446786832473046,
																"dt": -0.49988441978578824
															},
															"nextHandle": {
																"dv": 0.03350204467773421,
																"dt": 0.24872063847668704
															}
														},
														{
															"time": 0.4326400740763295,
															"value": 0.3,
															"mode": 2
														},
														{
															"time": 0.6893034202687399,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.03350204467773421,
																"dt": -0.20686304989585452
															},
															"nextHandle": {
																"dv": -0.03350204467773421,
																"dt": 0.20686304989585452
															}
														},
														{
															"time": 0.9075762262374045,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.0105709577780226,
																"dt": -0.05433141901344351
															},
															"nextHandle": {
																"dv": -0.015000000000000069,
																"dt": 0.11742758129538333
															}
														},
														{
															"time": 1.0178762262374046,
															"value": 1.25,
															"mode": 2
														},
														{
															"time": 1.3477205185255443,
															"value": 0.019999999999999962,
															"mode": 0,
															"prevHandle": {
																"dv": -0.017500000000000016,
																"dt": -0.23485516259076689
															},
															"nextHandle": {
																"dv": 0.003040608088761979,
																"dt": 0.04080585754634286
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.8338280829210029,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.050000000000000044,
																"dt": -0.4197689435407147
															},
															"nextHandle": {
																"dv": 0.009454142840255173,
																"dt": 0.07937111104274033
															}
														},
														{
															"time": 0.9026603370315602,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.0105709577780226,
																"dt": -0.05433141901344351
															},
															"nextHandle": {
																"dv": -0.015000000000000069,
																"dt": 0.11742758129538333
															}
														},
														{
															"time": 1.012592540797451,
															"value": 1.25,
															"mode": 2
														},
														{
															"time": 1.4658120861589312,
															"value": 0.019999999999999962,
															"mode": 0,
															"prevHandle": {
																"dv": -0.017500000000000016,
																"dt": -0.23485516259076689
															},
															"nextHandle": {
																"dv": 0.003040608088761979,
																"dt": 0.04080585754634286
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
													0.10980392156862745,
													0.5686274509803921,
													0.2823529411764706
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
															"time": 1.013,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4624971729516993,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.1498323909838998
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1498323909838998
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.11921467078796551,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.27569654447210157
															}
														},
														{
															"time": 0.6724026745732128,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.21666666666666667,
																"dt": -0.19929985975593162
															},
															"nextHandle": {
																"dv": -0.8166666666666667,
																"dt": 0.038862599761982364
															}
														},
														{
															"time": 0.7017481481465255,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.00978182452443758
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.49657148148935115
															}
														},
														{
															"time": 1.3379964322103095,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.1498323909838998
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1498323909838998
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_ImpactFrame",
									"enabled": false,
									"scaleX": 125,
									"scaleY": 125,
									"scaleZ": 50,
									"rotationZ": 24.999999999999996,
									"albedoMap": "Fx/Gradients/circGrad01.png",
									"emissive": 0.5,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 1,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.8901802963009368,
															"value": 0.011458333333333404,
															"mode": 0,
															"prevHandle": {
																"dv": -0.014976875997216066,
																"dt": -0.14224713341297948
															},
															"nextHandle": {
																"dv": 0.014976875997216066,
																"dt": 0.14224713341297948
															}
														},
														{
															"time": 1.0084560000052571,
															"value": 1.5,
															"mode": 1
														},
														{
															"time": 1.9920118518622365,
															"value": 0.011458333333333404,
															"mode": 0,
															"prevHandle": {
																"dv": 0.003298611111111127,
																"dt": -0.26456407407545335
															},
															"nextHandle": {
																"dv": -0.003298611111111127,
																"dt": 0.26456407407545335
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
													0.10980392156862745,
													0.5686274509803921,
													0.2823529411764706
												]
											}
										}
									]
								},
								{
									"type": "model",
									"name": "Shield_CarthagSlide",
									"source": "Fx/Meshes_Common/Shield_Arrakeen_StraightUV.fbx",
									"x": -1.6733,
									"y": -0.26701,
									"scaleX": 0.95,
									"scaleY": 0.95,
									"scaleZ": 0.95,
									"rotationZ": -64.7,
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
													"emissive": 4
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"saturation": 1,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/Alphas/T_SpiceAlpha.png",
												"uvShift": [
													0.2,
													0.5
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap-Slide",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.35,
												"saturation": 1,
												"width": 0.9,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl16u_A01.png",
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
													"name": "uvShift.x",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.32059068147914965,
																"dt": -0.4998246613718933
															},
															"nextHandle": {
																"dv": -0.050458527689237975,
																"dt": 0.271791203701135
															}
														},
														{
															"time": 1.0115815037310336,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.09959820801000036,
																"dt": -0.40686319584351727
															},
															"nextHandle": {
																"dv": 0.04878462835569844,
																"dt": 0.19928741889457519
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap-Pattern",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.94,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 3,
												"texture": "Fx/Alphas/Hextile_hex02-Both.png",
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
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": false,
												"bias": 0,
												"scale": 1,
												"power": 1,
												"color": [
													1,
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
													0.5490196078431373,
													1,
													0.7176470588235294
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 3
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
															"mode": 0,
															"prevHandle": {
																"dv": 0.024077112407804305,
																"dt": -0.4999955857353059
															},
															"nextHandle": {
																"dv": -0.03555555555555556,
																"dt": 0.7152880247277931
															}
														},
														{
															"time": 0.8445036139743486,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.017222222222223582,
																"dt": -0.40477736926463975
															},
															"nextHandle": {
																"dv": 0.015656698166256783,
																"dt": 0.3677741536683292
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 2.5361041320623334,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.546104132062333,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Shield_CarthagSlide",
							"source": "Fx/Meshes_Common/Shield_Arrakeen_StraightUV.fbx",
							"x": -1.6733,
							"y": -0.26701,
							"scaleX": 0.95,
							"scaleY": 0.95,
							"scaleZ": 0.95,
							"rotationZ": -64.7,
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
											"emissive": 4
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/T_SpiceAlpha.png",
										"uvShift": [
											0.2,
											0.5
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap-slide",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.35,
										"saturation": 1,
										"width": 0.9,
										"uvScaleX": 4,
										"uvScaleY": 4,
										"texture": "Fx/Gradients/Cyl16u_A01.png",
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
											"name": "uvShift.x",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 1
												},
												{
													"time": 0.5870718589459043,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.004503630113008861,
														"dt": -0.33000000000000007
													},
													"nextHandle": {
														"dv": -0.004503630113008861,
														"dt": 0.33000000000000007
													}
												},
												{
													"time": 1.6212176247336647,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0961072264500869,
														"dt": -0.35835663672789786
													},
													"nextHandle": {
														"dv": -0.0961072264500869,
														"dt": 0.35835663672789786
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "uvShift.x",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 1
												},
												{
													"time": 1.0442548818137432,
													"value": 0,
													"mode": 1
												},
												{
													"time": 1.0829737206291432,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.183,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "uvShift.x",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0.2863517037051966,
													"value": 0,
													"mode": 1
												},
												{
													"time": 0.2963517037051966,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.183,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.628882765431601
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.628882765431601
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap-Pattern",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.93,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 3,
										"texture": "Fx/Alphas/Hextile_hex02-Both.png",
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
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": false,
										"ALPHA": true,
										"REVERSE": false,
										"bias": 0,
										"scale": 1,
										"power": 1,
										"color": [
											1,
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
											0.5490196078431373,
											1,
											0.7176470588235294
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 5
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 1.0982587235044765,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.2171314336457453,
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
										"useScale": false,
										"wrap": true,
										"progress": 0.17,
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
										]
									}
								}
							]
						},
						{
							"type": "model",
							"name": "Shield_CarthagLight",
							"source": "Fx/Meshes_Common/Shield_Arrakeen_StraightUV.fbx",
							"x": -1.6733,
							"y": -0.26701,
							"scaleX": 0.95,
							"scaleY": 0.95,
							"scaleZ": 0.95,
							"rotationZ": -64.7,
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
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.36,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/T_SpiceAlpha.png",
										"uvShift": [
											0.2,
											0.5
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.3
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.6898776136363637,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.9949999999999999,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5452993939393938,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.183,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.46,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9949999999999999,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9999999999999998,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.183,
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
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 1,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": false,
										"ALPHA": true,
										"REVERSE": false,
										"bias": 0,
										"scale": 1,
										"power": 1,
										"color": [
											1,
											0,
											0
										]
									}
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.8727718889164171,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.014545454545454528
													}
												},
												{
													"time": 1.491549677752263,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.050000000000000044,
														"dt": -0.4197689435407147
													},
													"nextHandle": {
														"dv": 0.009454142840255173,
														"dt": 0.07937111104274033
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 1.0982587235044765,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.2171314336457453,
													"value": 1,
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
											0.10980392156862745,
											0.5686274509803921,
											0.2823529411764706
										]
									}
								}
							]
						},
						{
							"type": "model",
							"name": "Shield_CarthagBlue",
							"source": "Fx/Meshes_Common/Shield_Arrakeen_StraightUV.fbx",
							"x": -1.6733,
							"y": -0.26701,
							"scaleX": 0.95,
							"scaleY": 0.95,
							"scaleZ": 0.95,
							"rotationZ": -64.7,
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
										"alpha": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 1.5233772948705409,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.533377294870541,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.655150919290707,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.665150919290707,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.857879572244808,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.183,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap-Pattern",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.94,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1.75,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/Hextile_hex02-Both.png",
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
										"useScale": true,
										"wrap": true,
										"progress": 0.36,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/T_SpiceAlpha.png",
										"uvShift": [
											0.2,
											0.5
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
											0.7019607843137254,
											0.8,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": false,
										"ALPHA": true,
										"REVERSE": false,
										"bias": 0,
										"scale": 1,
										"power": 1,
										"color": [
											1,
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 1.0982587235044765,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.2171314336457453,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "position.y",
									"loop": true,
									"keys": [
										{
											"time": 1.5401246474132848,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.550124647413285,
											"value": -1.2610976029187475,
											"mode": 2
										},
										{
											"time": 1.6479693163923137,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.655150919290707,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.665150919290707,
											"value": -1.2610976029187475,
											"mode": 2
										},
										{
											"time": 1.857879572244808,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.183,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "position.z",
									"loop": true,
									"keys": [
										{
											"time": 1.5401246474132848,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.550124647413285,
											"value": 0.716666666666666,
											"mode": 2
										},
										{
											"time": 1.6479693163923137,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.655150919290707,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.665150919290707,
											"value": 0.716666666666666,
											"mode": 2
										},
										{
											"time": 1.857879572244808,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.183,
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
								"range": 3,
								"power": 0.8
							}
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.95,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"x": -0.02687,
							"y": 0.07273,
							"scaleX": 58.5,
							"scaleY": 58.5,
							"scaleZ": 58.5,
							"rotationZ": 114.9,
							"albedoMap": "Fx/Alphas/T_ArrakeenBorder01.png",
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 1,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 3
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.25,
													"mode": 2
												},
												{
													"time": 0.46,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9949999999999999,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9999999999999998,
													"value": 0.25,
													"mode": 2
												},
												{
													"time": 2.5,
													"value": 0.25,
													"mode": 2
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
										"alpha": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.108812082635248,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 3.651914045064065e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.10625000000000007,
														"dt": 0.3044293098446826
													}
												},
												{
													"time": 0.37778577004822056,
													"value": 1,
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
											0.10980392156862745,
											0.5686274509803921,
											0.2823529411764706
										]
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