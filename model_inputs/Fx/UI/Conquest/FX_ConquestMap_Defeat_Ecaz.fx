{
	"type": "fx",
	"cullingRadius": 1500,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"z": 1,
			"children": [
				{
					"type": "object",
					"name": "MapAtreides",
					"x": -0.02995,
					"y": -0.00038,
					"z": -1.43533,
					"children": [
						{
							"type": "object",
							"name": "Holograms_Circles",
							"z": -0.032,
							"scaleX": 0.97,
							"scaleY": 0.97,
							"scaleZ": 0.97,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"z": 0.10000000000000002,
									"scaleX": 1.672,
									"scaleY": 1.672,
									"scaleZ": 0.9500000000000001,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"emissive": 2
												}
											},
											"diffuseMap": "Fx/UI/Conquest/T_UI_Circle_Plain_2048_02.png",
											"children": [
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 0.46
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"enabled": false,
											"props": {
												"alpha": 1,
												"tag": null
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.9,
															"mode": 2
														},
														{
															"time": 1.4399789667899616,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9938170309399468,
															"value": 0.5575000000000001,
															"mode": 2
														},
														{
															"time": 3.046109352824919,
															"value": 0.9325,
															"mode": 2
														},
														{
															"time": 4.246091825149887,
															"value": 0.745,
															"mode": 2
														},
														{
															"time": 5.61222571671985,
															"value": 1,
															"mode": 2
														},
														{
															"time": 8.344493499859778,
															"value": 0.6666666666666666,
															"mode": 2
														},
														{
															"time": 9.01276835753199,
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
													0.6352941176470588,
													0.0784313725490196,
													0.3137254901960784
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon dotted",
									"z": 0.10000000000000002,
									"scaleX": 1.7100000000000004,
									"scaleY": 1.7100000000000004,
									"scaleZ": 0.9500000000000001,
									"rotationZ": -29.942032881837555,
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
													"alphaKill": false,
													"emissive": 0.5
												}
											},
											"diffuseMap": "Fx/Alphas/T_UI_Circle_DottedLines_Thin.png",
											"children": [
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 0.46
													}
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
													"time": 600,
													"value": -1,
													"mode": 2
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
													0.9647058823529412,
													0.5882352941176471,
													0.33725490196078434
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"props": {
										"noiseTexture": "Fx/noise/N_AnisotropicPixel.png",
										"directionalNoise": false,
										"intensity": 0.05,
										"scrollSpeed": [
											1,
											0
										],
										"scale": [
											2,
											2
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.1988039880201757,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.2088039880201755,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.2188039880201753,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.3039641787515754,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.3139641787515752,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.323964178751575,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "intensity",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.3039641787515754,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.3139641787515752,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.323964178751575,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "intensity",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.3039641787515754,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.3139641787515752,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.3493064312736447,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
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
							"type": "model",
							"name": "Hemisphere_Grid",
							"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
							"z": -0.0020000000000000018,
							"scaleX": 0.95,
							"scaleY": 0.95,
							"scaleZ": 0.2,
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
										"progress": 0.15,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Alphas/T_Grid_Circulard_1024.png",
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
											0.5058823529411764,
											0.43529411764705883,
											0.27058823529411763
										]
									},
									"children": [
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5058823529411764,
													0.43529411764705883,
													0.27058823529411763
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.2,
										"tag": null
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 1.4399789667899616,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9938170309399468,
													"value": 0.6238750000000003,
													"mode": 2
												},
												{
													"time": 3.046109352824919,
													"value": 0.9325,
													"mode": 2
												},
												{
													"time": 4.246091825149887,
													"value": 0.8113750000000002,
													"mode": 2
												},
												{
													"time": 5.61222571671985,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.344493499859778,
													"value": 0.7330416666666668,
													"mode": 2
												},
												{
													"time": 9.01276835753199,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"enabled": false,
									"props": {
										"noiseTexture": "Fx/noise/N_AnisotropicPixel.png",
										"directionalNoise": false,
										"intensity": 0.05,
										"scrollSpeed": [
											0,
											1
										],
										"scale": [
											5,
											5
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.1988039880201757,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.2088039880201755,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.2188039880201753,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.3039641787515754,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.3139641787515752,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.323964178751575,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "intensity",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.3039641787515754,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.3139641787515752,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.323964178751575,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
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
							"type": "model",
							"name": "Hemisphere_Boussole",
							"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
							"z": -0.0020000000000000018,
							"scaleX": 0.95,
							"scaleY": 0.95,
							"scaleZ": 0.2,
							"rotationZ": 5.159854705795816,
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
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false,
											"emissive": 2
										}
									},
									"diffuseMap": "Fx/Alphas/T_UI_Circle_Lines04.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.2
									}
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
											"time": 480,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.7
									}
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.05,
										"useRGB": false
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9647058823529412,
											0.5882352941176471,
											0.33725490196078434
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "TextureDots",
							"z": 0.038000000000000034,
							"scaleX": 2,
							"scaleY": 2,
							"rotationZ": -45.00000000000001,
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
											"alphaKill": false,
											"emissive": 5
										}
									},
									"diffuseMap": "Fx/Alphas/T_UI_Round_2048.png",
									"color": [
										0.8470588235294118,
										0.9411764705882353,
										0.9098039215686274,
										1
									]
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.5
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
										"progress": 0.09,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 30,
										"uvScaleY": 30,
										"texture": "Fx/Alphas/T_Grid10_Thick.png",
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
											0.5058823529411764,
											0.43529411764705883,
											0.27058823529411763
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.1,
										"useRGB": false
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1,
										"tag": null
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 1.4399789667899616,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9938170309399468,
													"value": 0.8,
													"mode": 2
												},
												{
													"time": 3.046109352824919,
													"value": 0.9325,
													"mode": 2
												},
												{
													"time": 4.246091825149887,
													"value": 0.8113750000000002,
													"mode": 2
												},
												{
													"time": 5.61222571671985,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.344493499859778,
													"value": 0.7931312500000002,
													"mode": 2
												},
												{
													"time": 9.01276835753199,
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
				},
				{
					"type": "object",
					"name": "Defeat",
					"z": -1.015116,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecalflashBlack",
							"z": -0.393494,
							"scaleX": 12,
							"scaleY": 12,
							"scaleZ": 9.6,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"renderMode": "AfterTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.8
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.5293416162296047,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.558406105734427,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.9491666666666667,
														"dt": -0.009815703460109293
													},
													"nextHandle": {
														"dv": 0.016666666666666607,
														"dt": 0.11722628443499605
													}
												},
												{
													"time": 0.6833826838763002,
													"value": 0,
													"mode": 0
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
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecalflashBlack",
							"z": -0.393494,
							"scaleX": 12,
							"scaleY": 12,
							"scaleZ": 9.6,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"renderMode": "AfterTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.8
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
													"mode": 0
												},
												{
													"time": 0.558406105734427,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.4542979797979799,
														"dt": -0.12469474633199151
													},
													"nextHandle": {
														"dv": 0.016666666666666607,
														"dt": 0.11722628443499605
													}
												},
												{
													"time": 0.6833826838763002,
													"value": 0,
													"mode": 0
												},
												{
													"time": 1.635,
													"value": 0.35,
													"mode": 1
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
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"z": -0.393494,
							"scaleX": 6.25,
							"scaleY": 6.25,
							"scaleZ": 5,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.45
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0.5949787992193818,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7449787992193817,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0023848778249737634,
														"dt": -0.1323197199992393
													},
													"nextHandle": {
														"dv": -0.0023848778249737634,
														"dt": 0.1323197199992393
													}
												},
												{
													"time": 2.2764306156383127,
													"value": -0.015421305812691855,
													"mode": 0
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.4975911303310801,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5349104651059111,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.012439778258277004
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.02002277803782356
													}
												},
												{
													"time": 0.5949787992193818,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7449787992193817,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0023848778249737634,
														"dt": -0.1323197199992393
													},
													"nextHandle": {
														"dv": -0.0023848778249737634,
														"dt": 0.1323197199992393
													}
												},
												{
													"time": 2.2764306156383127,
													"value": -0.015421305812691855,
													"mode": 0
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
											0.3137254901960784,
											0,
											0.12549019607843137
										]
									}
								}
							]
						},
						{
							"type": "object",
							"name": "Floor",
							"z": -0.3408340000000001,
							"children": [
								{
									"type": "model",
									"name": "Elec02",
									"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
									"z": -0.09,
									"scaleX": 3.5,
									"scaleY": 3.5,
									"scaleZ": 3.5,
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
												"texture": "Fx/Gradients/Cyl05u_A.jpg"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5189211918372632,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5189211918372632,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -0.861211311637784
															},
															"nextHandle": {
																"dv": 0.006451568043787952,
																"dt": 0.33333114543917053
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
												"progress": 0.2,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 1.25,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0.1,
													0
												],
												"uvShiftSpeed": [
													0.1,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "uvShift.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.504831431745417,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.504831431745417,
															"value": -0.25,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 4,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/causticTexture_02.png",
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
													"name": "uvShift.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.504831431745417,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.504831431745417,
															"value": -0.2,
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
											"name": "GradientMap",
											"source": "hrt.shader.GradientMap",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -14991
															},
															{
																"position": 1,
																"color": -3508976
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
											"name": "DissolveMap_Gradient",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/vGrad_inv.jpg",
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
													"keys": [
														{
															"time": 0.504831431745417,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 1.504831431745417,
															"value": 0.8,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.7215686274509804,
													0.4196078431372549,
													0.12156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.743057350364221,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.2927571140379257,
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
													0.7098039215686275,
													0.1411764705882353,
													0.06666666666666667
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5949787992193818,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7449787992193817,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0006993833375645853,
														"dt": -0.11577288982603151
													},
													"nextHandle": {
														"dv": 0.0006993833375645853,
														"dt": 0.11577288982603151
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Bol",
									"props": {
										"emitType": "Burst",
										"instScale": 0.3,
										"lifeTime": 2,
										"instRotation": [
											0,
											180,
											0
										],
										"warmUpTime": -0.3
									},
									"z": -0.35897,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "Hemisphere",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 5,
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
															"enableStencil": false,
															"parallax": 0,
															"emissive": 10
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.3,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/GradientSpice_2.png",
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
																	"time": 0.14040999847584212,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.12122382132456926,
																		"dt": -0.4994842701051498
																	},
																	"nextHandle": {
																		"dv": 0.033333333333333326,
																		"dt": 0.13734491693339435
																	}
																},
																{
																	"time": 0.35891327541533313,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.02
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3133333333333333
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
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.9764705882352941,
															0.7529411764705882,
															0.5137254901960784
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
														"useScale": true,
														"wrap": true,
														"progress": 0.34,
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
															0,
															0.4
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
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.48,
														"saturation": 0,
														"width": 0.4,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.3
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
														"range": 2,
														"power": 2
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
														"envBlend": 0.7,
														"envColorSet": false
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
															0.7098039215686275,
															0.1411764705882353,
															0.06666666666666667
														]
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 2.1815539740246592e-16,
														"dt": -0.18535050365489164
													},
													"nextHandle": {
														"dv": 1.1102230246251565e-16,
														"dt": 0.21844688309708893
													}
												},
												{
													"time": 0.28087639079408633,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9960410845230232,
													"value": 1.3,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.22752087249572386
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.22752087249572386
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
													"mode": 0,
													"prevHandle": {
														"dv": 0.02664527370121003,
														"dt": -0.1853207988671051
													},
													"nextHandle": {
														"dv": -0.02664527370121003,
														"dt": 0.1853207988671051
													}
												},
												{
													"time": 0.28087639079408633,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9960410845230232,
													"value": 1.3,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.22752087249572386
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.22752087249572386
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "BolSharp",
									"props": {
										"emitType": "Burst",
										"instScale": 0.3,
										"lifeTime": 2,
										"instRotation": [
											0,
											180,
											0
										],
										"warmUpTime": -0.3
									},
									"z": -0.35897,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "Hemisphere",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 7,
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
															"enableStencil": false,
															"parallax": 0,
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.3,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/GradientSpice_2.png",
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
																	"time": 0.14040999847584212,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.12122382132456926,
																		"dt": -0.4994842701051498
																	},
																	"nextHandle": {
																		"dv": 0.033333333333333326,
																		"dt": 0.13734491693339435
																	}
																},
																{
																	"time": 0.35891327541533313,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.02
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3133333333333333
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
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.9764705882352941,
															0.7529411764705882,
															0.5137254901960784
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
														"useScale": true,
														"wrap": true,
														"progress": 0.34,
														"saturation": 0,
														"width": 0.26,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.4
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
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.34,
														"saturation": 0,
														"width": 0.29,
														"uvScaleX": 4,
														"uvScaleY": 4,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.3
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
																	"time": 0.2090824569425393,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.11604552724598342,
																		"dt": -0.49988189441195807
																	},
																	"nextHandle": {
																		"dv": -0.06666666666666665,
																		"dt": 0.2871757354061881
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
														"range": 2,
														"power": 2
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
														"envBlend": 0.7,
														"envColorSet": false
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
															0.7098039215686275,
															0.1411764705882353,
															0.06666666666666667
														]
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 2.1815539740246592e-16,
														"dt": -0.18535050365489164
													},
													"nextHandle": {
														"dv": 1.1102230246251565e-16,
														"dt": 0.21844688309708893
													}
												},
												{
													"time": 0.28087639079408633,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9960410845230232,
													"value": 1.3,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.22752087249572386
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.22752087249572386
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
													"mode": 0,
													"prevHandle": {
														"dv": 0.02664527370121003,
														"dt": -0.1853207988671051
													},
													"nextHandle": {
														"dv": -0.02664527370121003,
														"dt": 0.1853207988671051
													}
												},
												{
													"time": 0.28087639079408633,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9960410845230232,
													"value": 1.3,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.22752087249572386
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.22752087249572386
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt_Flare",
							"z": -0.29590400000000017,
							"scaleX": 0.2,
							"scaleY": 0.2,
							"scaleZ": 0.36000000000000026,
							"rotationZ": 97.05328607958577,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 17.5,
									"scaleY": 210,
									"scaleZ": 7,
									"rotationX": -90,
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
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"parallax": 0,
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.4,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl05v_A.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
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
												"useScale": true,
												"wrap": true,
												"progress": 0.34,
												"saturation": 0,
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
													0.6
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
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.7,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.7670930371869713,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.012345250365260907,
																"dt": -0.49998263979306123
															},
															"nextHandle": {
																"dv": -0.016666666666666607,
																"dt": 0.6750000000000002
															}
														},
														{
															"time": 2.038343037186971,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.17437499999999972
															},
															"nextHandle": {
																"dv": -3.0344026245539974e-16,
																"dt": 0.41812499999999997
															}
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
												"texture": "Fx/Gradients/Cyl04v_A.jpg"
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
												"power": 2
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
													0.7098039215686275,
													0.1411764705882353,
													0.06666666666666667
												]
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.550545386175884,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 2.700283463870859e-16,
												"dt": -0.18535535932765834
											},
											"nextHandle": {
												"dv": 0.000500000000000167,
												"dt": 0.22632597243852615
											}
										},
										{
											"time": 0.7691795629845646,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.5152837390795921,
											"value": 1.8000000000000012,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.22752087249572386
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.22752087249572386
											}
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "DARKENPLANE",
							"z": -0.3,
							"scaleX": 4,
							"scaleY": 4,
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
											"colorMask": 255
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.25
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.1300000000000006,
													"value": 0,
													"mode": 0
												},
												{
													"time": 1.637340555951032,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -1.0666666666666667,
														"dt": -0.20734055595103135
													},
													"nextHandle": {
														"dv": 0.016666666666666607,
														"dt": 0.11722628443499605
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
					"type": "object",
					"name": "MapDefeat",
					"x": -0.02995,
					"y": -0.00038,
					"z": -1.43533,
					"children": [
						{
							"type": "object",
							"name": "Holograms_Circles",
							"z": -0.03200000000000003,
							"scaleX": 0.97,
							"scaleY": 0.97,
							"scaleZ": 0.97,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"z": 0.10000000000000002,
									"scaleX": 1.672,
									"scaleY": 1.672,
									"scaleZ": 0.9500000000000001,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"drawOrder": "120",
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/UI/Conquest/T_UI_Circle_Plain_2048_02.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.46
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6352941176470588,
													0.0784313725490196,
													0.3137254901960784
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
									"props": {
										"alpha": 3
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.7170474571080954,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8612585994692992,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"props": {
										"noiseTexture": "Fx/noise/N_AnisotropicPixel.png",
										"directionalNoise": false,
										"intensity": 0.05,
										"scrollSpeed": [
											1,
											0
										],
										"scale": [
											1,
											1
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7000378310214376,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7100378310214376,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7666897856242118,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3854370271122316,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3854370271122316,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3854370271122316,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3854370271122316,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3954370271122314,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3954370271122314,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3954370271122314,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3954370271122314,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4262295081967213,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5056746532156369,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5208070617906684,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5510718789407316,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.309041614123582,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.3190416141235817,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.3493064312736447,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
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
							"type": "model",
							"name": "Hemisphere_Grid",
							"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
							"enabled": false,
							"z": -0.0020000000000000018,
							"scaleX": 0.95,
							"scaleY": 0.95,
							"scaleZ": 0.2,
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
										"progress": 0.15,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Alphas/T_Grid_Circulard_1024.png",
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
											0.5058823529411764,
											0.43529411764705883,
											0.27058823529411763
										]
									},
									"children": [
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5058823529411764,
													0.43529411764705883,
													0.27058823529411763
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.2,
										"tag": null
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 1.4399789667899616,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9938170309399468,
													"value": 0.6238750000000003,
													"mode": 2
												},
												{
													"time": 3.046109352824919,
													"value": 0.9325,
													"mode": 2
												},
												{
													"time": 4.246091825149887,
													"value": 0.8113750000000002,
													"mode": 2
												},
												{
													"time": 5.61222571671985,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.344493499859778,
													"value": 0.7330416666666668,
													"mode": 2
												},
												{
													"time": 9.01276835753199,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
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
									0.7098039215686275,
									0.1411764705882353,
									0.06666666666666667
								]
							}
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"enabled": false,
							"props": {
								"alpha": 1
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 0.7170474571080954,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.8612585994692992,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.5151238238155564,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Glitches",
							"z": -0.0010000000000000009,
							"children": [
								{
									"type": "model",
									"name": "GlitchR",
									"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
									"z": -0.0010000000000000009,
									"scaleX": 0.95,
									"scaleY": 0.95,
									"scaleZ": 0.2,
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
													"emissive": 5
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
												"progress": 0.12,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 10,
												"uvScaleY": 10,
												"texture": "Fx/noise/N_AnisotropicPixel.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													2
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
												"progress": 0.12,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 5,
												"uvScaleY": 5,
												"texture": "Fx/noise/N_AnisotropicPixel.png",
												"uvShift": [
													0,
													0.5
												],
												"uvShiftSpeed": [
													0,
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
												"useScale": true,
												"wrap": true,
												"progress": 0.35,
												"saturation": 1,
												"width": 0.85,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0.5
												],
												"uvShiftSpeed": [
													0.1,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.15,
												"tag": null
											},
											"children": [
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
															"time": 2.1988039880201757,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.1988039880201757,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.1988039880201757,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.1988039880201757,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.2088039880201755,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.2088039880201755,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.2088039880201755,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.2088039880201755,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.2188039880201753,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.2188039880201753,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.2188039880201753,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.2188039880201753,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.323964178751575,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.323964178751575,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.323964178751575,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.323964178751575,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.323964178751575,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.323964178751575,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.323964178751575,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
															"value": 0,
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
															"time": 0.7000378310214376,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7100378310214376,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.7666897856242118,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.203114754098361,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.1988039880201757,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.1988039880201757,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.1988039880201757,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.1988039880201757,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.2088039880201755,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.2088039880201755,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.2088039880201755,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.2088039880201755,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.2131147540983607,
															"value": 0.8148536804156666,
															"mode": 2
														},
														{
															"time": 2.2320870113493063,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.2433795712484237,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3190416141235817,
															"value": 0.9122527436978968,
															"mode": 2
														},
														{
															"time": 2.371828499369483,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7000378310214376,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7100378310214376,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.7666897856242118,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3854370271122316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3854370271122316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3854370271122316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3854370271122316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3954370271122314,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3954370271122314,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3954370271122314,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3954370271122314,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4262295081967213,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5056746532156369,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5208070617906684,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5510718789407316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.309041614123582,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3190416141235817,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3493064312736447,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "power",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0.700096015930177,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.710096015930177,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.8724153709411628,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3808261871337897,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.39082618713379,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5125998115539558,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5225998115539559,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.7153284645080569,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.995,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.02,
												"useRGB": false
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5058823529411764,
													0.43529411764705883,
													0.27058823529411763
												]
											}
										}
									]
								},
								{
									"type": "object",
									"name": "ChromaticAb",
									"z": 0.0010000000000000009,
									"children": [
										{
											"type": "object",
											"name": "Hemisphere",
											"y": -1.0842021724855044e-19,
											"z": -0.0020000000000000018,
											"children": [
												{
													"type": "model",
													"name": "Hemisphere_GridB",
													"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
													"x": -0.004,
													"y": -0.004,
													"scaleX": 0.95,
													"scaleY": 0.95,
													"scaleZ": 0.2,
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
																"progress": 0.15,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Alphas/T_Grid_Circulard_1024.png",
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
																	0,
																	1,
																	0.8941176470588235
																]
															}
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.06,
																"tag": null
															}
														},
														{
															"type": "shader",
															"name": "AlphaKill",
															"source": "shaders/AlphaKill.hx",
															"props": {
																"threshold": 0.02,
																"useRGB": false
															}
														}
													]
												},
												{
													"type": "model",
													"name": "Hemisphere_GridR",
													"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
													"x": 0.004,
													"y": 0.004,
													"scaleX": 0.95,
													"scaleY": 0.95,
													"scaleZ": 0.2,
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
																"progress": 0.15,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Alphas/T_Grid_Circulard_1024.png",
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
																"alpha": 0.06,
																"tag": null
															}
														},
														{
															"type": "shader",
															"name": "AlphaKill",
															"source": "shaders/AlphaKill.hx",
															"props": {
																"threshold": 0.02,
																"useRGB": false
															}
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "Boussole",
											"z": -0.0020000000000000018,
											"children": [
												{
													"type": "model",
													"name": "Hemisphere_Boussole",
													"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
													"x": -0.004,
													"y": -0.004,
													"scaleX": 0.95,
													"scaleY": 0.95,
													"scaleZ": 0.2,
													"rotationZ": 5.159854705795816,
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
																	"depthTest": "Less",
																	"colorMask": 15,
																	"enableStencil": false,
																	"alphaKill": false,
																	"emissive": 2
																}
															},
															"diffuseMap": "Fx/Alphas/T_UI_Circle_Lines04.png",
															"color": [
																1,
																0.8470588235294118,
																0.43137254901960786,
																1
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 0.2
															}
														},
														{
															"type": "shader",
															"name": "AlphaKill",
															"source": "shaders/AlphaKill.hx",
															"props": {
																"threshold": 0.05,
																"useRGB": false
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
																	0,
																	0
																]
															}
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
																	"time": 480,
																	"value": 1,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "model",
													"name": "Hemisphere_BoussoleB",
													"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
													"x": 0.004,
													"y": 0.004,
													"scaleX": 0.95,
													"scaleY": 0.95,
													"scaleZ": 0.2,
													"rotationZ": 5.159854705795816,
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
																	"depthTest": "Less",
																	"colorMask": 15,
																	"enableStencil": false,
																	"alphaKill": false,
																	"emissive": 2
																}
															},
															"diffuseMap": "Fx/Alphas/T_UI_Circle_Lines04.png",
															"color": [
																1,
																0.8470588235294118,
																0.43137254901960786,
																1
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 0.2
															}
														},
														{
															"type": "shader",
															"name": "AlphaKill",
															"source": "shaders/AlphaKill.hx",
															"props": {
																"threshold": 0.05,
																"useRGB": false
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
																	1,
																	0.8941176470588235
																]
															}
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
																	"time": 480,
																	"value": 1,
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
														"alpha": 0.45
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/N_AnisotropicPixel.png",
												"directionalNoise": false,
												"intensity": 0.05,
												"scrollSpeed": [
													1,
													0
												],
												"scale": [
													2,
													2
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.1988039880201757,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.2088039880201755,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.2188039880201753,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.323964178751575,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.323964178751575,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "intensity",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7000378310214376,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7100378310214376,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.7666897856242118,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3854370271122316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3854370271122316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3854370271122316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3854370271122316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3954370271122314,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3954370271122314,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3954370271122314,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3954370271122314,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4262295081967213,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5056746532156369,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5208070617906684,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5510718789407316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.309041614123582,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3190416141235817,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3493064312736447,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
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
													"time": 0.6253980277681248,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7696091701293286,
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
				},
				{
					"type": "model",
					"name": "Table_Ecaz",
					"source": "UI/ConquestMenu/Assets/Ecaz/Table_Ecaz.fbx",
					"editorOnly": true,
					"z": -2.3877699999999997,
					"scaleX": 0.99,
					"scaleY": 0.99,
					"scaleZ": 0.99,
					"rotationZ": 89.99999999999999,
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
							"diffuseMap": "UI/ConquestMenu/Assets/Ecaz/Table_Ecaz_Albedo.png"
						}
					]
				},
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"locked": true,
					"z": -1.5,
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
					"name": "group",
					"enabled": false,
					"x": -0.01997,
					"y": -2.36995,
					"z": -1.29526,
					"children": [
						{
							"type": "object",
							"name": "MapEcaz",
							"x": -0.009983333333333334,
							"y": -0.0001266666666666083,
							"z": -0.14007133333333344,
							"children": [
								{
									"type": "object",
									"name": "Holograms_Circles",
									"z": -0.032,
									"scaleX": 0.97,
									"scaleY": 0.97,
									"scaleZ": 0.97,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"z": 0.10000000000000002,
											"scaleX": 1.672,
											"scaleY": 1.672,
											"scaleZ": 0.9500000000000001,
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
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": false,
															"emissive": 5
														}
													},
													"diffuseMap": "Fx/UI/Conquest/T_UI_Circle_Plain_2048_02.png"
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 0.46
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6352941176470588,
															0.0784313725490196,
															0.3137254901960784
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon dotted",
											"z": 0.10000000000000002,
											"scaleX": 1.7100000000000004,
											"scaleY": 1.7100000000000004,
											"scaleZ": 0.9500000000000001,
											"rotationZ": -29.942032881837555,
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
															"alphaKill": false,
															"emissive": 0.5
														}
													},
													"diffuseMap": "Fx/Alphas/T_UI_Circle_DottedLines_Thin.png",
													"children": [
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 0.46
															}
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
															"time": 600,
															"value": -1,
															"mode": 2
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
															0.9647058823529412,
															0.5882352941176471,
															0.33725490196078434
														]
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.02,
												"useRGB": false
											}
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/N_AnisotropicPixel.png",
												"directionalNoise": false,
												"intensity": 0.05,
												"scrollSpeed": [
													1,
													0
												],
												"scale": [
													2,
													2
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.1988039880201757,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.2088039880201755,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.2188039880201753,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.323964178751575,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "intensity",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.323964178751575,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3493064312736447,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
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
									"name": "LINES_Hemisphere",
									"enabled": false,
									"z": -0.0020000000000000018,
									"rotationZ": 4.127883764636654,
									"children": [
										{
											"type": "model",
											"name": "HemisphereLines",
											"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
											"scaleX": 0.95,
											"scaleY": 0.95,
											"scaleZ": 0.2,
											"rotationZ": -35,
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
															"alphaKill": false,
															"emissive": 5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"color": [
														0.8470588235294118,
														0.9411764705882353,
														0.9098039215686274,
														1
													]
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 0.4
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
														"progress": 0.2,
														"saturation": 0,
														"width": 0.99,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl16u_A_1024.png",
														"uvShift": [
															0,
															0.7
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "uvShift.y",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.6584362139917701,
																	"mode": 2
																},
																{
																	"time": 50,
																	"value": 0.7652570461819851,
																	"mode": 2
																},
																{
																	"time": 100,
																	"value": 0.6584,
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
															0.5058823529411764,
															0.43529411764705883,
															0.27058823529411763
														]
													}
												}
											]
										},
										{
											"type": "model",
											"name": "HemisphereLines",
											"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
											"scaleX": 0.95,
											"scaleY": 0.95,
											"scaleZ": 0.2,
											"rotationZ": 45,
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
															"alphaKill": false,
															"emissive": 5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"color": [
														0.8470588235294118,
														0.9411764705882353,
														0.9098039215686274,
														1
													]
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 0.4
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
														"progress": 0.2,
														"saturation": 0,
														"width": 0.99,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl16u_A_1024.png",
														"uvShift": [
															0,
															0.4
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "uvShift.y",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.41877388524060616,
																	"mode": 2
																},
																{
																	"time": 50,
																	"value": 0.31128497701301483,
																	"mode": 2
																},
																{
																	"time": 100,
																	"value": 0.4188,
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
															0.5058823529411764,
															0.43529411764705883,
															0.27058823529411763
														]
													}
												}
											]
										},
										{
											"type": "model",
											"name": "HemisphereLines",
											"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
											"scaleX": 0.95,
											"scaleY": 0.95,
											"scaleZ": 0.2,
											"rotationZ": 115,
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
															"alphaKill": false,
															"emissive": 5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"color": [
														0.8470588235294118,
														0.9411764705882353,
														0.9098039215686274,
														1
													]
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 0.4
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
														"progress": 0.2,
														"saturation": 0,
														"width": 0.99,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl16u_A_1024.png",
														"uvShift": [
															0,
															0.8
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "uvShift.y",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.6799782804123498,
																	"mode": 2
																},
																{
																	"time": 50,
																	"value": 0.7998500402169935,
																	"mode": 2
																},
																{
																	"time": 100,
																	"value": 0.68,
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
															0.5058823529411764,
															0.43529411764705883,
															0.27058823529411763
														]
													}
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
													"time": 600,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.5
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.01,
												"useRGB": false
											}
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/N_AnisotropicPixel.png",
												"directionalNoise": false,
												"intensity": 0.05,
												"scrollSpeed": [
													1,
													0
												],
												"scale": [
													2,
													2
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.1988039880201757,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.2088039880201755,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.2188039880201753,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.323964178751575,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "intensity",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.323964178751575,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
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
									"type": "model",
									"name": "Hemisphere_Grid",
									"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
									"z": -0.0020000000000000018,
									"scaleX": 0.95,
									"scaleY": 0.95,
									"scaleZ": 0.2,
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
												"progress": 0.15,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_Grid_Circulard_1024.png",
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
													0.5058823529411764,
													0.43529411764705883,
													0.27058823529411763
												]
											},
											"children": [
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5058823529411764,
															0.43529411764705883,
															0.27058823529411763
														]
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.2,
												"tag": null
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.9,
															"mode": 2
														},
														{
															"time": 1.4399789667899616,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9938170309399468,
															"value": 0.6238750000000003,
															"mode": 2
														},
														{
															"time": 3.046109352824919,
															"value": 0.9325,
															"mode": 2
														},
														{
															"time": 4.246091825149887,
															"value": 0.8113750000000002,
															"mode": 2
														},
														{
															"time": 5.61222571671985,
															"value": 1,
															"mode": 2
														},
														{
															"time": 8.344493499859778,
															"value": 0.7330416666666668,
															"mode": 2
														},
														{
															"time": 9.01276835753199,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.02,
												"useRGB": false
											}
										}
									]
								},
								{
									"type": "model",
									"name": "Hemisphere_Boussole",
									"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
									"z": -0.0020000000000000018,
									"scaleX": 0.95,
									"scaleY": 0.95,
									"scaleZ": 0.2,
									"rotationZ": 5.159854705795816,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"emissive": 2
												}
											},
											"diffuseMap": "Fx/Alphas/T_UI_Circle_Lines04.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.2
											}
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
													"time": 480,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.7
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.05,
												"useRGB": false
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9647058823529412,
													0.5882352941176471,
													0.33725490196078434
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "TextureDots",
									"z": 0.038000000000000034,
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": -45.00000000000001,
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
													"alphaKill": false,
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Alphas/T_UI_Round_2048.png",
											"color": [
												0.8470588235294118,
												0.9411764705882353,
												0.9098039215686274,
												1
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
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
												"progress": 0.09,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 30,
												"uvScaleY": 30,
												"texture": "Fx/Alphas/T_Grid10_Thick.png",
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
													0.5058823529411764,
													0.43529411764705883,
													0.27058823529411763
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.1,
												"useRGB": false
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1,
												"tag": null
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.9,
															"mode": 2
														},
														{
															"time": 1.4399789667899616,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9938170309399468,
															"value": 0.8,
															"mode": 2
														},
														{
															"time": 3.046109352824919,
															"value": 0.9325,
															"mode": 2
														},
														{
															"time": 4.246091825149887,
															"value": 0.8113750000000002,
															"mode": 2
														},
														{
															"time": 5.61222571671985,
															"value": 1,
															"mode": 2
														},
														{
															"time": 8.344493499859778,
															"value": 0.7931312500000002,
															"mode": 2
														},
														{
															"time": 9.01276835753199,
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
						},
						{
							"type": "object",
							"name": "Defeat",
							"x": 0.019966666666666667,
							"y": 0.0002533333333332166,
							"z": 0.28014266666666665,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecalflashBlack",
									"z": -0.393494,
									"scaleX": 12,
									"scaleY": 12,
									"scaleZ": 9.6,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"renderMode": "AfterTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.8
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.5293416162296047,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.558406105734427,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.9491666666666667,
																"dt": -0.009815703460109293
															},
															"nextHandle": {
																"dv": 0.016666666666666607,
																"dt": 0.11722628443499605
															}
														},
														{
															"time": 0.6833826838763002,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.558406105734427,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.4542979797979799,
																"dt": -0.12469474633199151
															},
															"nextHandle": {
																"dv": 0.016666666666666607,
																"dt": 0.11722628443499605
															}
														},
														{
															"time": 0.6833826838763002,
															"value": 0,
															"mode": 0
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
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecalflashBlack",
									"z": -0.393494,
									"scaleX": 12,
									"scaleY": 12,
									"scaleZ": 9.6,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"renderMode": "AfterTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.8
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 1,
													"keys": [
														{
															"time": 0.5293416162296047,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.558406105734427,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.9491666666666667,
																"dt": -0.009815703460109293
															},
															"nextHandle": {
																"dv": 0.016666666666666607,
																"dt": 0.11722628443499605
															}
														},
														{
															"time": 0.6833826838763002,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.558406105734427,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.4542979797979799,
																"dt": -0.12469474633199151
															},
															"nextHandle": {
																"dv": 0.016666666666666607,
																"dt": 0.11722628443499605
															}
														},
														{
															"time": 0.6833826838763002,
															"value": 0,
															"mode": 0
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
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"z": -0.393494,
									"scaleX": 6.25,
									"scaleY": 6.25,
									"scaleZ": 5,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.45
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 1,
													"keys": [
														{
															"time": 0.5949787992193818,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7449787992193817,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0023848778249737634,
																"dt": -0.1323197199992393
															},
															"nextHandle": {
																"dv": -0.0023848778249737634,
																"dt": 0.1323197199992393
															}
														},
														{
															"time": 2.2764306156383127,
															"value": -0.015421305812691855,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.4975911303310801,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5349104651059111,
															"value": 0.5,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.012439778258277004
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.02002277803782356
															}
														},
														{
															"time": 0.5949787992193818,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7449787992193817,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0023848778249737634,
																"dt": -0.1323197199992393
															},
															"nextHandle": {
																"dv": -0.0023848778249737634,
																"dt": 0.1323197199992393
															}
														},
														{
															"time": 2.2764306156383127,
															"value": -0.015421305812691855,
															"mode": 0
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
													0.3137254901960784,
													0,
													0.12549019607843137
												]
											}
										}
									]
								},
								{
									"type": "object",
									"name": "Floor",
									"z": -0.3408340000000001,
									"children": [
										{
											"type": "model",
											"name": "Elec02",
											"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
											"z": -0.09,
											"scaleX": 3.5,
											"scaleY": 3.5,
											"scaleZ": 3.5,
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
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.5189211918372632,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.5189211918372632,
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666663,
																		"dt": -0.861211311637784
																	},
																	"nextHandle": {
																		"dv": 0.006451568043787952,
																		"dt": 0.33333114543917053
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
														"progress": 0.2,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 1.25,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0.1,
															0
														],
														"uvShiftSpeed": [
															0.1,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "uvShift.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.504831431745417,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.504831431745417,
																	"value": -0.25,
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 4,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/causticTexture_02.png",
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
															"name": "uvShift.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.504831431745417,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.504831431745417,
																	"value": -0.2,
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
													"name": "GradientMap",
													"source": "hrt.shader.GradientMap",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -14991
																	},
																	{
																		"position": 1,
																		"color": -3508976
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
													"name": "DissolveMap_Gradient",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 3,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/vGrad_inv.jpg",
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
															"keys": [
																{
																	"time": 0.504831431745417,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1.504831431745417,
																	"value": 0.8,
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
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.7215686274509804,
															0.4196078431372549,
															0.12156862745098039
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.743057350364221,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.2927571140379257,
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
															0.7098039215686275,
															0.1411764705882353,
															0.06666666666666667
														]
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5949787992193818,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7449787992193817,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0006993833375645853,
																"dt": -0.11577288982603151
															},
															"nextHandle": {
																"dv": 0.0006993833375645853,
																"dt": 0.11577288982603151
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "Bol",
											"props": {
												"emitType": "Burst",
												"instScale": 0.3,
												"lifeTime": 2,
												"instRotation": [
													0,
													180,
													0
												],
												"warmUpTime": -0.3
											},
											"z": -0.35897,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "model",
													"name": "Hemisphere",
													"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
													"scaleX": 4,
													"scaleY": 4,
													"scaleZ": 5,
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
																	"enableStencil": false,
																	"parallax": 0,
																	"emissive": 10
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
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 0.3,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/GradientSpice_2.png",
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
																			"time": 0.14040999847584212,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.12122382132456926,
																				"dt": -0.4994842701051498
																			},
																			"nextHandle": {
																				"dv": 0.033333333333333326,
																				"dt": 0.13734491693339435
																			}
																		},
																		{
																			"time": 0.35891327541533313,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.02
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3133333333333333
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
															"name": "ColorMult",
															"source": "shaders/ColorMult.hx",
															"enabled": false,
															"props": {
																"amount": 1,
																"color": [
																	0.9764705882352941,
																	0.7529411764705882,
																	0.5137254901960784
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
																"useScale": true,
																"wrap": true,
																"progress": 0.34,
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
																	0,
																	0.4
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
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.48,
																"saturation": 0,
																"width": 0.4,
																"uvScaleX": 2,
																"uvScaleY": 2,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	0.3
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
																"range": 2,
																"power": 2
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
																"envBlend": 0.7,
																"envColorSet": false
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
																	0.7098039215686275,
																	0.1411764705882353,
																	0.06666666666666667
																]
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instStretch.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 2.1815539740246592e-16,
																"dt": -0.18535050365489164
															},
															"nextHandle": {
																"dv": 1.1102230246251565e-16,
																"dt": 0.21844688309708893
															}
														},
														{
															"time": 0.28087639079408633,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9960410845230232,
															"value": 1.3,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.22752087249572386
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.22752087249572386
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
															"mode": 0,
															"prevHandle": {
																"dv": 0.02664527370121003,
																"dt": -0.1853207988671051
															},
															"nextHandle": {
																"dv": -0.02664527370121003,
																"dt": 0.1853207988671051
															}
														},
														{
															"time": 0.28087639079408633,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9960410845230232,
															"value": 1.3,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.22752087249572386
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.22752087249572386
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "BolSharp",
											"props": {
												"emitType": "Burst",
												"instScale": 0.3,
												"lifeTime": 2,
												"instRotation": [
													0,
													180,
													0
												],
												"warmUpTime": -0.3
											},
											"z": -0.35897,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "model",
													"name": "Hemisphere",
													"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
													"scaleX": 5,
													"scaleY": 5,
													"scaleZ": 7,
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
																	"enableStencil": false,
																	"parallax": 0,
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
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 0.3,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/GradientSpice_2.png",
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
																			"time": 0.14040999847584212,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.12122382132456926,
																				"dt": -0.4994842701051498
																			},
																			"nextHandle": {
																				"dv": 0.033333333333333326,
																				"dt": 0.13734491693339435
																			}
																		},
																		{
																			"time": 0.35891327541533313,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.02
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3133333333333333
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
															"name": "ColorMult",
															"source": "shaders/ColorMult.hx",
															"enabled": false,
															"props": {
																"amount": 1,
																"color": [
																	0.9764705882352941,
																	0.7529411764705882,
																	0.5137254901960784
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
																"useScale": true,
																"wrap": true,
																"progress": 0.34,
																"saturation": 0,
																"width": 0.26,
																"uvScaleX": 2,
																"uvScaleY": 2,
																"texture": "Fx/noise/Wave_01.jpg",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	0.4
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
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.34,
																"saturation": 0,
																"width": 0.29,
																"uvScaleX": 4,
																"uvScaleY": 4,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	0.3
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
																			"time": 0.2090824569425393,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.11604552724598342,
																				"dt": -0.49988189441195807
																			},
																			"nextHandle": {
																				"dv": -0.06666666666666665,
																				"dt": 0.2871757354061881
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
																"range": 2,
																"power": 2
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
																"envBlend": 0.7,
																"envColorSet": false
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
																	0.7098039215686275,
																	0.1411764705882353,
																	0.06666666666666667
																]
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instStretch.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 2.1815539740246592e-16,
																"dt": -0.18535050365489164
															},
															"nextHandle": {
																"dv": 1.1102230246251565e-16,
																"dt": 0.21844688309708893
															}
														},
														{
															"time": 0.28087639079408633,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9960410845230232,
															"value": 1.3,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.22752087249572386
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.22752087249572386
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
															"mode": 0,
															"prevHandle": {
																"dv": 0.02664527370121003,
																"dt": -0.1853207988671051
															},
															"nextHandle": {
																"dv": -0.02664527370121003,
																"dt": 0.1853207988671051
															}
														},
														{
															"time": 0.28087639079408633,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9960410845230232,
															"value": 1.3,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.22752087249572386
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.22752087249572386
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt_Flare",
									"z": -0.29590400000000017,
									"scaleX": 0.2,
									"scaleY": 0.2,
									"scaleZ": 0.36000000000000026,
									"rotationZ": 97.05328607958577,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										1
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 17.5,
											"scaleY": 210,
											"scaleZ": 7,
											"rotationX": -90,
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
															"colorMask": 255,
															"depthTest": "LessEqual",
															"enableStencil": false,
															"parallax": 0,
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.4,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/Cyl05v_A.png",
														"onDecal": false
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.9764705882352941,
															0.7529411764705882,
															0.5137254901960784
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
														"useScale": true,
														"wrap": true,
														"progress": 0.34,
														"saturation": 0,
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
															0.6
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
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.7,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.7670930371869713,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.012345250365260907,
																		"dt": -0.49998263979306123
																	},
																	"nextHandle": {
																		"dv": -0.016666666666666607,
																		"dt": 0.6750000000000002
																	}
																},
																{
																	"time": 2.038343037186971,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.17437499999999972
																	},
																	"nextHandle": {
																		"dv": -3.0344026245539974e-16,
																		"dt": 0.41812499999999997
																	}
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
														"texture": "Fx/Gradients/Cyl04v_A.jpg"
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
														"power": 2
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
															0.7098039215686275,
															0.1411764705882353,
															0.06666666666666667
														]
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.550545386175884,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 2.700283463870859e-16,
														"dt": -0.18535535932765834
													},
													"nextHandle": {
														"dv": 0.000500000000000167,
														"dt": 0.22632597243852615
													}
												},
												{
													"time": 0.7691795629845646,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5152837390795921,
													"value": 1.8000000000000012,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.22752087249572386
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.22752087249572386
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Loop",
									"z": 1.015116,
									"scaleX": 0.15,
									"scaleY": 0.15,
									"scaleZ": 0.15,
									"children": [
										{
											"type": "emitter",
											"name": "Sparks",
											"enabled": false,
											"props": {
												"alignMode": "Screen",
												"instScale": 0.045,
												"lifeTime": 3,
												"burstParticleCount": 30,
												"maxCount": 100,
												"emitShape": "Cylinder",
												"instAcceleration_rand": [
													0,
													0,
													0
												],
												"instScale_rand": 0.03,
												"emitRate": 25,
												"emitAngle": 360,
												"lifeTimeRand": 1,
												"instSpeed": [
													0,
													0,
													0.6
												],
												"instSpeed_rand": [
													0,
													0,
													0.2
												],
												"useRandomColor": true,
												"randomColor1": [
													0.6392156862745098,
													0.34901960784313724,
													0.19215686274509802,
													1
												],
												"randomColor2": [
													0.9764705882352941,
													0.7215686274509804,
													0.396078431372549,
													1
												],
												"frameCount": 4,
												"frameDivisionX": 2,
												"frameDivisionY": 2,
												"animationSpeed": 0,
												"spriteSheet": "Fx/Alphas/T_DustParticles02.png"
											},
											"z": -9.6642,
											"scaleX": 12.5,
											"scaleY": 12.5,
											"scaleZ": 5,
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
																	"depthTest": "LessEqual",
																	"enableStencil": false,
																	"parallax": 0,
																	"emissive": 50,
																	"drawOrder": "120"
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
																"texture": "Fx/Gradients/circGrad3.jpg"
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
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.16666666666666666
																			}
																		},
																		{
																			"time": 0.5,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.16666666666666666
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.16666666666666666
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.16666666666666666
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.16666666666666666
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
																"range": 15,
																"power": 2
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.6167427365323539,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3333333333333333
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
											"name": "FlarescreenInfinty",
											"enabled": false,
											"props": {
												"alignMode": "Screen",
												"instScale": 25,
												"lifeTime": 2,
												"instOffset": [
													0,
													0,
													1
												],
												"emitRate": 3
											},
											"z": -6.24804,
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
																	"mode": "BeforeTonemapping",
																	"blend": "Alpha",
																	"shadows": false,
																	"culling": "None",
																	"colorMask": 255,
																	"depthTest": "LessEqual",
																	"enableStencil": false,
																	"parallax": 0
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
																"alpha": 0.5,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_circle2.png"
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": -0.0031778692272519393,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.5056226185032769,
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
															"type": "shader",
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 5,
																"power": 1
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorMult",
															"source": "shaders/ColorMult.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.9764705882352941,
																	0.7529411764705882,
																	0.5137254901960784
																]
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
														"amount": 0.05,
														"ATTENUATE": false,
														"emissiveMap": "Fx/Gradients/z_FillGrey50.jpg"
													}
												}
											]
										},
										{
											"type": "emitter",
											"name": "FlarescreenInfinty",
											"enabled": false,
											"props": {
												"alignMode": "Screen",
												"instScale": 25,
												"lifeTime": 2,
												"instOffset": [
													0,
													0,
													1
												],
												"emitRate": 3
											},
											"z": -6.24804,
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
																	"mode": "BeforeTonemapping",
																	"blend": "Alpha",
																	"shadows": false,
																	"culling": "None",
																	"colorMask": 255,
																	"depthTest": "LessEqual",
																	"enableStencil": false,
																	"parallax": 0
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
																"texture": "Fx/Alphas/T_circle2.png"
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": -0.0031778692272519393,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.5056226185032769,
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
															"type": "shader",
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 5,
																"power": 1
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorMult",
															"source": "shaders/ColorMult.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.9764705882352941,
																	0.7529411764705882,
																	0.5137254901960784
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
																	0.7098039215686275,
																	0.1411764705882353,
																	0.06666666666666667
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
																	0.3137254901960784,
																	0,
																	0.12549019607843137
																]
															}
														}
													]
												},
												{
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.05,
														"ATTENUATE": false,
														"emissiveMap": "Fx/Gradients/z_FillGrey50.jpg"
													}
												}
											]
										},
										{
											"type": "emitter",
											"name": "FlarescreenInfintyRed",
											"props": {
												"alignMode": "Screen",
												"instScale": 25,
												"lifeTime": 2,
												"instOffset": [
													0,
													0,
													1
												],
												"emitRate": 3,
												"instRotation": [
													30,
													0,
													0
												]
											},
											"z": -6.24804,
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
																	"mode": "BeforeTonemapping",
																	"blend": "Alpha",
																	"shadows": false,
																	"culling": "None",
																	"colorMask": 255,
																	"depthTest": "LessEqual",
																	"enableStencil": false,
																	"parallax": 0
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
																"alpha": 0.7,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_circle2.png"
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": -0.0031778692272519393,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.5056226185032769,
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
															"type": "shader",
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 5,
																"power": 1
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorMult",
															"source": "shaders/ColorMult.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.9764705882352941,
																	0.7529411764705882,
																	0.5137254901960784
																]
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"enabled": false,
															"props": {
																"amount": 1,
																"color": [
																	0.3137254901960784,
																	0,
																	0.12549019607843137
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
																	0.7098039215686275,
																	0.1411764705882353,
																	0.06666666666666667
																]
															}
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
																				"color": 4283432992
																			},
																			{
																				"position": 0.31640625,
																				"color": -4905710
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
														"amount": 0.05,
														"ATTENUATE": false,
														"emissiveMap": "Fx/Gradients/z_FillGrey50.jpg"
													}
												}
											]
										},
										{
											"type": "emitter",
											"name": "FlarescreenInfintygre",
											"enabled": false,
											"props": {
												"alignMode": "Screen",
												"instScale": 25,
												"lifeTime": 2,
												"instOffset": [
													0,
													0,
													1
												],
												"emitRate": 3,
												"instRotation": [
													30,
													0,
													0
												]
											},
											"z": -6.24804,
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
																	"mode": "AfterTonemapping",
																	"blend": "Alpha",
																	"shadows": false,
																	"culling": "None",
																	"colorMask": 255,
																	"depthTest": "LessEqual",
																	"enableStencil": false,
																	"parallax": 0
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
																"alpha": 5,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_circle2.png"
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": -0.0031778692272519393,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.5056226185032769,
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
															"type": "shader",
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 5,
																"power": 1
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorMult",
															"source": "shaders/ColorMult.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.9764705882352941,
																	0.7529411764705882,
																	0.5137254901960784
																]
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"enabled": false,
															"props": {
																"amount": 1,
																"color": [
																	0.7098039215686275,
																	0.1411764705882353,
																	0.06666666666666667
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
																	0.12549019607843137,
																	0.12549019607843137,
																	0.12549019607843137
																]
															}
														}
													]
												},
												{
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.05,
														"ATTENUATE": false,
														"emissiveMap": "Fx/Gradients/z_FillGrey50.jpg"
													}
												}
											]
										},
										{
											"type": "lookAt",
											"name": "lookAt",
											"enabled": false,
											"x": 0.06815,
											"y": -0.76453,
											"z": -9.23131,
											"scaleZ": 2,
											"target": "camera",
											"lockAxis": [
												0,
												0,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"scaleX": 12,
													"scaleY": 12,
													"scaleZ": 12,
													"rotationX": 90,
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
																	"culling": "Back",
																	"colorMask": 255
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
																"progress": 0.41,
																"saturation": 1,
																"width": 0.7,
																"uvScaleX": 3,
																"uvScaleY": 6,
																"texture": "Fx/Alphas/Dust04.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	-0.14
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
																"progress": 0.41,
																"saturation": 1,
																"width": 0.7,
																"uvScaleX": 3,
																"uvScaleY": 6,
																"texture": "Fx/Alphas/Dust05.png",
																"uvShift": [
																	0.05,
																	0.1
																],
																"uvShiftSpeed": [
																	-0.01,
																	-0.12
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
																"progress": 0.41,
																"saturation": 1,
																"width": 0.78,
																"uvScaleX": 2,
																"uvScaleY": 4,
																"texture": "Fx/noise/T_Fire.png",
																"uvShift": [
																	0.05,
																	0.1
																],
																"uvShiftSpeed": [
																	-0.01,
																	-0.12
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "progress",
																	"keys": [
																		{
																			"time": 0.5665792901759494,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 1.9240687569934525,
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
																	1,
																	0.8549019607843137,
																	0.611764705882353
																]
															}
														},
														{
															"type": "shader",
															"name": "GradientMap",
															"source": "hrt.shader.GradientMap",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -8174804
																			},
																			{
																				"position": 0.34765625,
																				"color": -319243113
																			},
																			{
																				"position": 1,
																				"color": -205389
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
											"type": "polygon",
											"name": "polygon",
											"enabled": false,
											"x": 2,
											"y": 2,
											"z": -8.81108,
											"scaleX": 25,
											"scaleY": 25,
											"scaleZ": 25,
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
															"enableStencil": false,
															"parallax": 0
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
														"alpha": 0.8,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": -0.0031778692272519393,
																	"value": 0,
																	"mode": 2
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
													"type": "shader",
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9764705882352941,
															0.7529411764705882,
															0.5137254901960784
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
															0.7098039215686275,
															0.1411764705882353,
															0.06666666666666667
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.3137254901960784,
															0,
															0.12549019607843137
														]
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
							"name": "MapDefeat",
							"x": -0.009983333333333334,
							"y": -0.0001266666666666667,
							"z": -0.14007133333333344,
							"children": [
								{
									"type": "object",
									"name": "Holograms_Circles",
									"z": -0.032,
									"scaleX": 0.97,
									"scaleY": 0.97,
									"scaleZ": 0.97,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"z": 0.10000000000000002,
											"scaleX": 1.672,
											"scaleY": 1.672,
											"scaleZ": 0.9500000000000001,
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
															"alphaKill": false,
															"drawOrder": "120",
															"emissive": 7
														}
													},
													"diffuseMap": "Fx/UI/Conquest/T_UI_Circle_Plain_2048_02.png"
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 0.46
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.02,
												"useRGB": false
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
													"keys": [
														{
															"time": 0.7170474571080954,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.8612585994692992,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/N_AnisotropicPixel.png",
												"directionalNoise": false,
												"intensity": 0.05,
												"scrollSpeed": [
													1,
													0
												],
												"scale": [
													1,
													1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.1988039880201757,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.2088039880201755,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.2188039880201753,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.323964178751575,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3039641787515754,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3139641787515752,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.323964178751575,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "intensity",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7000378310214376,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7100378310214376,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.7666897856242118,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3854370271122316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3854370271122316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3854370271122316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3854370271122316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3954370271122314,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3954370271122314,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3954370271122314,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3954370271122314,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4262295081967213,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5056746532156369,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5208070617906684,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5510718789407316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.309041614123582,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3190416141235817,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3493064312736447,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
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
									"type": "model",
									"name": "Hemisphere_Grid",
									"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
									"z": -0.0020000000000000018,
									"scaleX": 0.95,
									"scaleY": 0.95,
									"scaleZ": 0.2,
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
												"progress": 0.15,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_Grid_Circulard_1024.png",
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
													0.5058823529411764,
													0.43529411764705883,
													0.27058823529411763
												]
											},
											"children": [
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5058823529411764,
															0.43529411764705883,
															0.27058823529411763
														]
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.2,
												"tag": null
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.9,
															"mode": 2
														},
														{
															"time": 1.4399789667899616,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9938170309399468,
															"value": 0.6238750000000003,
															"mode": 2
														},
														{
															"time": 3.046109352824919,
															"value": 0.9325,
															"mode": 2
														},
														{
															"time": 4.246091825149887,
															"value": 0.8113750000000002,
															"mode": 2
														},
														{
															"time": 5.61222571671985,
															"value": 1,
															"mode": 2
														},
														{
															"time": 8.344493499859778,
															"value": 0.7330416666666668,
															"mode": 2
														},
														{
															"time": 9.01276835753199,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.02,
												"useRGB": false
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
															"time": 0.7170474571080954,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.8612585994692992,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5151238238155564,
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.7098039215686275,
											0.1411764705882353,
											0.06666666666666667
										]
									}
								},
								{
									"type": "object",
									"name": "Glitches",
									"z": -0.0010000000000000009,
									"children": [
										{
											"type": "model",
											"name": "GlitchR",
											"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
											"z": -0.0010000000000000009,
											"scaleX": 0.95,
											"scaleY": 0.95,
											"scaleZ": 0.2,
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
															"emissive": 5
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
														"progress": 0.12,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 10,
														"uvScaleY": 10,
														"texture": "Fx/noise/N_AnisotropicPixel.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															2
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
														"progress": 0.12,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 5,
														"uvScaleY": 5,
														"texture": "Fx/noise/N_AnisotropicPixel.png",
														"uvShift": [
															0,
															0.5
														],
														"uvShiftSpeed": [
															0,
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
														"useScale": true,
														"wrap": true,
														"progress": 0.35,
														"saturation": 1,
														"width": 0.85,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Water_04.png",
														"uvShift": [
															0,
															0.5
														],
														"uvShiftSpeed": [
															0.1,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.2,
														"tag": null
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7000378310214376,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7100378310214376,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7666897856242118,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3854370271122316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3854370271122316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3854370271122316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3854370271122316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3954370271122314,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.3954370271122314,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.3954370271122314,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.3954370271122314,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.4262295081967213,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.5056746532156369,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.5208070617906684,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.5510718789407316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.309041614123582,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.3190416141235817,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.3493064312736447,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "AlphaKill",
													"source": "shaders/AlphaKill.hx",
													"props": {
														"threshold": 0.02,
														"useRGB": false
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.7098039215686275,
															0.1411764705882353,
															0.06666666666666667
														]
													}
												}
											]
										},
										{
											"type": "object",
											"name": "ChromaticAb",
											"z": 0.0010000000000000009,
											"children": [
												{
													"type": "object",
													"name": "Hemisphere",
													"y": -1.0842021724855044e-19,
													"z": -0.0020000000000000018,
													"children": [
														{
															"type": "model",
															"name": "Hemisphere_GridB",
															"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
															"x": -0.004,
															"y": -0.004,
															"scaleX": 0.95,
															"scaleY": 0.95,
															"scaleZ": 0.2,
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
																		"progress": 0.15,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Alphas/T_Grid_Circulard_1024.png",
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
																			0,
																			1,
																			0.8941176470588235
																		]
																	}
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.06,
																		"tag": null
																	}
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.02,
																		"useRGB": false
																	}
																}
															]
														},
														{
															"type": "model",
															"name": "Hemisphere_GridR",
															"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
															"x": 0.004,
															"y": 0.004,
															"scaleX": 0.95,
															"scaleY": 0.95,
															"scaleZ": 0.2,
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
																		"progress": 0.15,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Alphas/T_Grid_Circulard_1024.png",
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
																		"alpha": 0.06,
																		"tag": null
																	}
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.02,
																		"useRGB": false
																	}
																}
															]
														}
													]
												},
												{
													"type": "object",
													"name": "Boussole",
													"z": -0.0020000000000000018,
													"children": [
														{
															"type": "model",
															"name": "Hemisphere_Boussole",
															"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
															"x": -0.004,
															"y": -0.004,
															"scaleX": 0.95,
															"scaleY": 0.95,
															"scaleZ": 0.2,
															"rotationZ": 5.159854705795816,
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
																			"depthTest": "Less",
																			"colorMask": 15,
																			"enableStencil": false,
																			"alphaKill": false,
																			"emissive": 2
																		}
																	},
																	"diffuseMap": "Fx/Alphas/T_UI_Circle_Lines04.png",
																	"color": [
																		1,
																		0.8470588235294118,
																		0.43137254901960786,
																		1
																	]
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.2
																	}
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.05,
																		"useRGB": false
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
																			0,
																			0
																		]
																	}
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
																			"time": 480,
																			"value": 1,
																			"mode": 2
																		}
																	]
																}
															]
														},
														{
															"type": "model",
															"name": "Hemisphere_BoussoleB",
															"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
															"x": 0.004,
															"y": 0.004,
															"scaleX": 0.95,
															"scaleY": 0.95,
															"scaleZ": 0.2,
															"rotationZ": 5.159854705795816,
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
																			"depthTest": "Less",
																			"colorMask": 15,
																			"enableStencil": false,
																			"alphaKill": false,
																			"emissive": 2
																		}
																	},
																	"diffuseMap": "Fx/Alphas/T_UI_Circle_Lines04.png",
																	"color": [
																		1,
																		0.8470588235294118,
																		0.43137254901960786,
																		1
																	]
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.2
																	}
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.05,
																		"useRGB": false
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
																			1,
																			0.8941176470588235
																		]
																	}
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
																			"time": 480,
																			"value": 1,
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
																"alpha": 0.45
															}
														}
													]
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/N_AnisotropicPixel.png",
														"directionalNoise": false,
														"intensity": 0.05,
														"scrollSpeed": [
															1,
															0
														],
														"scale": [
															2,
															2
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "intensity",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.1988039880201757,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.2088039880201755,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.2188039880201753,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.3039641787515754,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.3139641787515752,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.323964178751575,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "intensity",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.3039641787515754,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.3139641787515752,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.323964178751575,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "intensity",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7000378310214376,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7100378310214376,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7666897856242118,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3854370271122316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3854370271122316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3854370271122316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3854370271122316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3954370271122314,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.3954370271122314,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.3954370271122314,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.3954370271122314,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.4262295081967213,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.5056746532156369,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.5208070617906684,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.5510718789407316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.309041614123582,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.3190416141235817,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.3493064312736447,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3,
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
															"time": 0.6253980277681248,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7696091701293286,
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
	]
}