{
	"type": "fx",
	"cullingRadius": 150,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "polygon",
					"name": "polygon",
					"editorOnly": true,
					"z": 0.44000000000000017,
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
					"name": "testHextile",
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Hextile",
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
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
										"alpha": 0.7,
										"uScale": 2.5,
										"vScale": 3,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Hextile_hex02.png"
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
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/T_SpiceAlpha.png",
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
										"progress": 0.84,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Hextilescan",
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"emissive": 5,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"uScale": 2.5,
										"vScale": 3,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Hextile_hex02.png"
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
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/T_SpiceAlpha.png",
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
										"progress": 0.3,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3,
										"texture": "Fx/Gradients/Cyl16u_A.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.35
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
										"progress": 0.86,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "HextileInside",
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"alpha": 0.85,
										"uScale": 2.5,
										"vScale": 3,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Hextile_hex02-Inside.png"
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
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/T_SpiceAlpha.png",
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
										"progress": 0.37,
										"saturation": 1,
										"width": 0.93,
										"uvScaleX": 3,
										"uvScaleY": 3,
										"texture": "Fx/Gradients/Cyl16u_A.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.35
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
										"progress": 0.84,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
										]
									}
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
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.8
							}
						}
					]
				},
				{
					"type": "object",
					"name": "backup",
					"enabled": false,
					"x": -7.703719777548943e-34,
					"y": 0.09719666666666668,
					"z": -0.09565583333333333,
					"children": [
						{
							"type": "object",
							"name": "testHextile",
							"enabled": false,
							"x": 7.703719777548943e-34,
							"y": -0.09719666666666668,
							"z": 0.09565583333333333,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Hextile",
									"scaleX": 150,
									"scaleY": 150,
									"scaleZ": 50,
									"rotationZ": 89.99999999999999,
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
												"alpha": 0.75,
												"uScale": 7,
												"vScale": 7,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/Hextile02.png"
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
												"progress": 0.32,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/Alphas/T_SpiceAlpha.png",
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
												"progress": 0.86,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.075,
													0.05
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Hextilescan",
									"scaleX": 150,
									"scaleY": 150,
									"scaleZ": 50,
									"rotationZ": 89.99999999999999,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 5,
									"renderMode": "BeforeTonemapping",
									"children": [
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
												"uScale": 7,
												"vScale": 7,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/Hextile02.png"
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
												"progress": 0.32,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/Alphas/T_SpiceAlpha.png",
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
												"progress": 0.3,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3,
												"texture": "Fx/Gradients/Cyl16u_A.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.45
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
												"progress": 0.89,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.075,
													0.05
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "HextileInside",
									"scaleX": 150,
									"scaleY": 150,
									"scaleZ": 50,
									"rotationZ": 89.99999999999999,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"renderMode": "BeforeTonemapping",
									"children": [
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
												"alpha": 0.85,
												"uScale": 7,
												"vScale": 7,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/Hextile05.png"
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
												"progress": 0.32,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/Alphas/T_SpiceAlpha.png",
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
												"progress": 0.37,
												"saturation": 1,
												"width": 0.93,
												"uvScaleX": 3,
												"uvScaleY": 3,
												"texture": "Fx/Gradients/Cyl16u_A.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.45
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
												"progress": 0.86,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.075,
													0.05
												]
											}
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
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.8
									}
								}
							]
						},
						{
							"type": "object",
							"name": "logo",
							"enabled": false,
							"x": 7.703719777548943e-34,
							"y": -0.09719666666666668,
							"z": 0.09565583333333333,
							"children": [
								{
									"type": "advancedDecal",
									"name": "growingcircle",
									"enabled": false,
									"x": -6.018531076210111e-33,
									"y": -0.19439333333333333,
									"z": 0.19131166666666669,
									"scaleX": 44,
									"scaleY": 44,
									"scaleZ": 70.17809825027207,
									"albedoMap": "Fx/Alphas/T-InnerGradient.png",
									"fadeStart": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
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
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.477641410275758,
																"dt": -0.23128300334750976
															},
															"nextHandle": {
																"dv": -1.15,
																"dt": 0.18
															}
														},
														{
															"time": 2,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4,
															"value": 0,
															"mode": 0
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
															"time": 2.5,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.25,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.15333333333333335
															}
														},
														{
															"time": 0.9949999999999999,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.2649999999999999
															},
															"nextHandle": {
																"dv": -2.735044518095755e-16,
																"dt": 0.335
															}
														},
														{
															"time": 1.9999999999999998,
															"value": 0.25,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33499999999999996
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666674
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0.187037037037037,
													"value": 0.25,
													"mode": 0,
													"prevHandle": {
														"dv": -1.2324051059924013,
														"dt": -1.832211209568279
													},
													"nextHandle": {
														"dv": 0.4201235451904888,
														"dt": 0.6255555555555555
													}
												},
												{
													"time": 1.2928395061728395,
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0037229339507492965,
														"dt": -0.22876543209876554
													},
													"nextHandle": {
														"dv": -0.0027194816775288912,
														"dt": 0.18997176610430994
													}
												},
												{
													"time": 4,
													"value": 0.9,
													"mode": 0
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "logo",
									"scaleX": 25,
									"scaleY": 25,
									"scaleZ": 30,
									"rotationZ": 90,
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
												"alpha": 0.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_LogoShield05.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
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
												},
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.25,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.15333333333333335
															}
														},
														{
															"time": 2,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.6666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.6666666666666666
															}
														},
														{
															"time": 4,
															"value": 0.25,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33499999999999996
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666674
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
									"name": "outsidecircle",
									"scaleX": 40,
									"scaleY": 40,
									"scaleZ": 50,
									"rotationZ": 90,
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
												"alpha": 0.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_Target1.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.25,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.15333333333333335
															}
														},
														{
															"time": 0.9949999999999999,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.2649999999999999
															},
															"nextHandle": {
																"dv": -2.735044518095755e-16,
																"dt": 0.335
															}
														},
														{
															"time": 1.9999999999999998,
															"value": 0.25,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33499999999999996
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666674
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.25,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.15333333333333335
															}
														},
														{
															"time": 2,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.6666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.6666666666666666
															}
														},
														{
															"time": 4,
															"value": 0.25,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33499999999999996
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666674
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.4949999999999999,
													"value": 0.99,
													"mode": 0,
													"prevHandle": {
														"dv": -0.125,
														"dt": -1.085
													},
													"nextHandle": {
														"dv": 0.0191555190995555,
														"dt": 0.1662699057841416
													}
												},
												{
													"time": 1.9999999999999998,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4,
													"value": 1,
													"mode": 0
												}
											]
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.0160535573959348,
													"value": 0.99,
													"mode": 0,
													"prevHandle": {
														"dv": -0.056477272727272654,
														"dt": -0.5160535573959348
													},
													"nextHandle": {
														"dv": 0.018433924306061934,
														"dt": 0.16634856728808406
													}
												},
												{
													"time": 1.5210535573959347,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.021053557395935,
													"value": 1,
													"mode": 0
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
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
									"props": {
										"alpha": 0.7
									}
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
													"time": 0.9940525627136232,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}