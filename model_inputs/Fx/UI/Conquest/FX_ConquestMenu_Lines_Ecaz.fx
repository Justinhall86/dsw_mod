{
	"type": "fx",
	"markers": [
		{
			"t": 8.80576
		}
	],
	"cullingRadius": 500,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Table_Corrino",
					"source": "UI/ConquestMenu/Assets/Harkonnen/Table_Harkonnen.fbx",
					"editorOnly": true,
					"z": -0.79792,
					"rotationZ": 90
				},
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"locked": true,
					"z": -0.05,
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
					"name": "Map",
					"z": 0.032,
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
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 2.4737865762647298,
													"value": 0.3,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.21519004009593487
													}
												},
												{
													"time": 3.075006964849623,
													"value": 1.01,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.16710296684118675
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.056719022687609054
													}
												},
												{
													"time": 3.3376667042186985,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "position.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6664099846832239,
													"value": -0.06751140133378378,
													"mode": 2
												},
												{
													"time": 1.6165960469587488,
													"value": 0.005,
													"mode": 0,
													"prevHandle": {
														"dv": 1.217345973304833e-17,
														"dt": -0.14689152883090276
													},
													"nextHandle": {
														"dv": -1.217345973304833e-17,
														"dt": 0.14689152883090276
													}
												},
												{
													"time": 1.7680935398466233,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0012099927809557445,
														"dt": -0.21401983654185397
													},
													"nextHandle": {
														"dv": -0.00033802922884118764,
														"dt": 0.07307615346119797
													}
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.6524751357856482,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.4801409551091547
															}
														},
														{
															"time": 3.0254785868493923,
															"value": 1,
															"mode": 2
														},
														{
															"time": 7.811557513249028,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 2.4737865762647298,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.21519004009593487
															}
														},
														{
															"time": 3.075006964849623,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16710296684118675
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.056719022687609054
															}
														},
														{
															"time": 3.3376667042186985,
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
									"rotationZ": -32.91552628817202,
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
											"type": "curve",
											"name": "position.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 2.9044344817970575,
													"value": -0.06751140133378378,
													"mode": 2
												},
												{
													"time": 3.6957747748416914,
													"value": 0.005,
													"mode": 0,
													"prevHandle": {
														"dv": 1.217345973304833e-17,
														"dt": -0.14689152883090276
													},
													"nextHandle": {
														"dv": -1.217345973304833e-17,
														"dt": 0.14689152883090276
													}
												},
												{
													"time": 4.243290116993155,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0012099927809557445,
														"dt": -0.21401983654185397
													},
													"nextHandle": {
														"dv": -0.00033802922884118764,
														"dt": 0.07307615346119797
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.4
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keys": [
														{
															"time": 3.1198126631836125,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.726062358938382,
															"value": 1,
															"mode": 2
														},
														{
															"time": 7.811557513249028,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 3.1198126631836125,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.726062358938382,
															"value": 1,
															"mode": 2
														},
														{
															"time": 7.811557513249028,
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
								}
							]
						},
						{
							"type": "object",
							"name": "LINES_Hemisphere",
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.6352941176470588,
													0.0784313725490196,
													0.3137254901960784
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
													0.7411764705882353,
													0.4627450980392157,
													0.27450980392156865
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.9647058823529412,
													0.5882352941176471,
													0.33725490196078434
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
													0.7411764705882353,
													0.4627450980392157,
													0.27450980392156865
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
													0.7411764705882353,
													0.4627450980392157,
													0.27450980392156865
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
										"alpha": 0.3
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 2.7084124608573346,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.7084124608573346,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.507437827544989,
													"value": 1,
													"mode": 2
												},
												{
													"time": 7.811557513249028,
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
											0.7764705882352941,
											0.7294117647058823,
											0.6745098039215687
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
										"alpha": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 2.4144814131860626,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.4144814131860626,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3.1909028872302088,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.1909028872302088,
													"value": 1,
													"mode": 2
												},
												{
													"time": 7.811557513249028,
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
										"alpha": 0.04,
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
										"threshold": 0.005,
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
											"blend": "Alpha",
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
									"children": [
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
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
											"time": 480,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "position.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 3.1687505852234175,
											"value": -0.06751140133378378,
											"mode": 2
										},
										{
											"time": 3.9600908782680513,
											"value": 0.003,
											"mode": 0,
											"prevHandle": {
												"dv": 1.217345973304833e-17,
												"dt": -0.14689152883090276
											},
											"nextHandle": {
												"dv": -1.217345973304833e-17,
												"dt": 0.14689152883090276
											}
										},
										{
											"time": 4.850357286361934,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0012099927809557445,
												"dt": -0.21401983654185397
											},
											"nextHandle": {
												"dv": -0.00033802922884118764,
												"dt": 0.07307615346119797
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.15
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 3.3841287666099724,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3.990378462364742,
													"value": 1,
													"mode": 2
												},
												{
													"time": 7.811557513249028,
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
							"z": 0.038000000000000006,
							"scaleX": 2,
							"scaleY": 2,
							"rotationZ": -45,
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
										"threshold": 0.05,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "position.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 3.1687505852234175,
											"value": -0.06751140133378378,
											"mode": 2
										},
										{
											"time": 3.9600908782680513,
											"value": 0.003,
											"mode": 0,
											"prevHandle": {
												"dv": 1.217345973304833e-17,
												"dt": -0.14689152883090276
											},
											"nextHandle": {
												"dv": -1.217345973304833e-17,
												"dt": 0.14689152883090276
											}
										},
										{
											"time": 4.850357286361934,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0012099927809557445,
												"dt": -0.21401983654185397
											},
											"nextHandle": {
												"dv": -0.00033802922884118764,
												"dt": 0.07307615346119797
											}
										}
									]
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
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.5
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 2.4144814131860626,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.4144814131860626,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3.1909028872302088,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.1909028872302088,
													"value": 1,
													"mode": 2
												},
												{
													"time": 7.811557513249028,
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