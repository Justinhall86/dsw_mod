{
	"type": "fx",
	"markers": [
		{
			"t": 2.8790948478123886
		}
	],
	"cullingRadius": 2,
	"children": [
		{
			"type": "object",
			"name": "Holograms",
			"children": [
				{
					"type": "polygon",
					"name": "polygon",
					"z": 0.09,
					"scaleX": 1.76,
					"scaleY": 1.76,
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
							"color": [
								0.8470588235294118,
								0.9411764705882353,
								0.9098039215686274,
								1
							],
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
									"keyMode": 0,
									"keys": [
										{
											"time": 0.5730599157730552,
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
											"time": 1.9460633668367993,
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
				},
				{
					"type": "polygon",
					"name": "polygon dotted",
					"z": 0.09,
					"scaleX": 1.8,
					"scaleY": 1.8,
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
							"color": [
								1,
								0.8470588235294118,
								0.43137254901960786,
								1
							],
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
									"time": 60,
									"value": -0.1,
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
								"alpha": 1
							},
							"children": [
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
						}
					]
				},
				{
					"type": "polygon",
					"name": "polygon dotted 2",
					"z": 0.05,
					"scaleX": 1.97,
					"scaleY": 1.97,
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
							"diffuseMap": "Fx/Alphas/T_UI_Circle_Dots.png",
							"color": [
								1,
								0.8470588235294118,
								0.43137254901960786,
								1
							],
							"children": [
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.22
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
									"time": 240,
									"value": 0.1,
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
								"alpha": 1
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
						}
					]
				},
				{
					"type": "object",
					"name": "lines v2 donuts",
					"z": 0.13,
					"visible": false,
					"children": [
						{
							"type": "polygon",
							"name": "polygon inner 2",
							"z": -0.04000000000000001,
							"scaleX": 0.86,
							"scaleY": 0.86,
							"scaleZ": 1.7,
							"kind": 1,
							"args": [
								128,
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
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"emissive": 0.5
										}
									},
									"diffuseMap": "Fx/UI/Conquest/glow (130) rectangular.png",
									"color": [
										0.396078431372549,
										0.45098039215686275,
										0.43529411764705883,
										1
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
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 0.9116511680309083,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.8069076658820173,
													"value": 0.55,
													"mode": 2
												},
												{
													"time": 2.9824861472992334,
													"value": 1,
													"mode": 2
												},
												{
													"time": 7.0317009166252,
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
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon inner 2",
							"z": 0.01999999999999999,
							"scaleX": 0.49,
							"scaleY": 0.49,
							"scaleZ": 0.96,
							"kind": 1,
							"args": [
								80,
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
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"emissive": 0.5
										}
									},
									"diffuseMap": "Fx/UI/Conquest/glow (130) rectangular.png",
									"color": [
										0.7019607843137254,
										0.792156862745098,
										0.7647058823529411,
										1
									]
								},
								{
									"type": "material",
									"name": "material",
									"enabled": false,
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false
										}
									},
									"diffuseMap": "Fx/UI/Conquest/glow (130) rectangular.png",
									"color": [
										0.8470588235294118,
										0.9411764705882353,
										0.9098039215686274,
										1
									],
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
										"alpha": 1
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
													"time": 0.9116511680309083,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.8069076658820173,
													"value": 0.55,
													"mode": 2
												},
												{
													"time": 2.9824861472992334,
													"value": 1,
													"mode": 2
												},
												{
													"time": 7.0317009166252,
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
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon inner 2",
							"z": 0.01999999999999999,
							"scaleX": 0.49,
							"scaleY": 0.49,
							"scaleZ": 0.96,
							"kind": 1,
							"args": [
								80,
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
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"emissive": 0.5
										}
									},
									"diffuseMap": "Fx/UI/Conquest/glow (130) rectangular.png",
									"color": [
										0.7019607843137254,
										0.792156862745098,
										0.7647058823529411,
										1
									]
								},
								{
									"type": "material",
									"name": "material",
									"enabled": false,
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false
										}
									},
									"diffuseMap": "Fx/UI/Conquest/glow (130) rectangular.png",
									"color": [
										0.8470588235294118,
										0.9411764705882353,
										0.9098039215686274,
										1
									],
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
										"alpha": 1
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
													"time": 0.9116511680309083,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.8069076658820173,
													"value": 0.55,
													"mode": 2
												},
												{
													"time": 2.9824861472992334,
													"value": 1,
													"mode": 2
												},
												{
													"time": 7.0317009166252,
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
								}
							]
						}
					]
				}
			]
		}
	]
}