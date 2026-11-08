{
	"type": "fx",
	"cullingRadius": 150,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"x": 15,
			"scaleX": 100,
			"scaleY": 100,
			"scaleZ": 70,
			"rotationZ": 180,
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
					"type": "trails",
					"name": "Trails_tiling",
					"startWidth": 4,
					"endWidth": 4,
					"lifetime": 100,
					"minSpeed": 0.0001,
					"uvMode": "ETileFixed",
					"uvStretch": 0.0325,
					"uvRepeat": "EClamp",
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
									"drawOrder": "100",
									"emissive": 4
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
						},
						{
							"type": "curve",
							"name": "position.y",
							"keys": [
								{
									"time": 0,
									"value": -1.7117394144690268,
									"mode": 2
								},
								{
									"time": 0.1,
									"value": 23.58715694673836,
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
									"time": 0,
									"value": -1,
									"mode": 2
								},
								{
									"time": 0.05,
									"value": 8.060309919227834,
									"mode": 0,
									"prevHandle": {
										"dv": -0.033735795454546746,
										"dt": -0.01361001577287066
									},
									"nextHandle": {
										"dv": -4.481927875025472e-15,
										"dt": 0.016932698334359456
									}
								},
								{
									"time": 0.1,
									"value": 2,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.y",
							"enabled": false,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.1,
									"value": 39,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.z",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": -1,
									"mode": 2
								},
								{
									"time": 0.05,
									"value": 5,
									"mode": 0,
									"prevHandle": {
										"dv": 0.12274058487979111,
										"dt": -0.027418404988911745
									},
									"nextHandle": {
										"dv": -0.24196295690442915,
										"dt": 0.03178674327127079
									}
								},
								{
									"time": 0.1,
									"value": -1,
									"mode": 2
								}
							]
						},
						{
							"type": "shader",
							"name": "AnimatedTexture",
							"source": "h3d.shader.AnimatedTexture",
							"props": {
								"useSourceUVs": false,
								"blendBetweenFrames": true,
								"startFrame": 0,
								"texture": "Fx/Alphas/T_ElectricArc_1x4_14.png",
								"speed": 13,
								"frameDivision": [
									1,
									4
								],
								"totalFrames": 4,
								"startTime": 0,
								"loop": true
							}
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
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.580392156862745,
									0.4549019607843137,
									0.9921568627450981
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
									0,
									0
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.09699974746828972,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.10699974746828972,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.16040496176861682,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.1730265765650571,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.23856694647606427,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.254296635254706,
											"value": 0,
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
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": false,
								"useScale": true,
								"wrap": true,
								"progress": 0.5,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 1,
								"texture": "Fx/noise/clouds_Dissolve.png",
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
									"loop": true,
									"keys": [
										{
											"time": 0.08650383051484481,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.4799152539531057,
												"dt": -0.4848407179172708
											},
											"nextHandle": {
												"dv": -0.09630571539104382,
												"dt": 0.03173395368362694
											}
										},
										{
											"time": 0.1318380500628833,
											"value": 0.35,
											"mode": 2
										},
										{
											"time": 0.1744522164380395,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.24698696771490108,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3633383047057127,
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
					"type": "trails",
					"name": "Trails_sparkles",
					"enabled": false,
					"z": 1,
					"startWidth": 4,
					"endWidth": 4,
					"minSpeed": 1,
					"uvMode": "ETileFixed",
					"uvStretch": 0.0325,
					"uvRepeat": "EClamp",
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
									"drawOrder": "100",
									"emissive": 5
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
						},
						{
							"type": "curve",
							"name": "position.y",
							"enabled": false,
							"keys": [
								{
									"time": 0.03262519716088329,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.1,
									"value": 52,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.z",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0.051776167895661786,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.0765442139486143,
									"value": 10,
									"mode": 0,
									"prevHandle": {
										"dv": -0.033735795454546746,
										"dt": -0.01361001577287066
									},
									"nextHandle": {
										"dv": -4.481927875025472e-15,
										"dt": 0.016932698334359456
									}
								},
								{
									"time": 0.10209441870537858,
									"value": 0,
									"mode": 2
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
								"alpha": 2,
								"uScale": 4,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0.1,
								"texture": "Fx/Alphas/T_circle5.png"
							}
						},
						{
							"type": "curve",
							"name": "position.z",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.033596214511041014,
									"value": -1,
									"mode": 2
								},
								{
									"time": 0.065,
									"value": 5,
									"mode": 0,
									"prevHandle": {
										"dv": -0.033735795454546746,
										"dt": -0.01361001577287066
									},
									"nextHandle": {
										"dv": -4.481927875025472e-15,
										"dt": 0.016932698334359456
									}
								},
								{
									"time": 0.1,
									"value": -1,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.y",
							"keys": [
								{
									"time": 0,
									"value": -19,
									"mode": 2
								},
								{
									"time": 0.1,
									"value": 39,
									"mode": 2
								}
							]
						},
						{
							"type": "shader",
							"name": "AnimatedTexture",
							"source": "h3d.shader.AnimatedTexture",
							"enabled": false,
							"props": {
								"useSourceUVs": false,
								"blendBetweenFrames": true,
								"startFrame": 0,
								"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
								"speed": 13,
								"frameDivision": [
									1,
									4
								],
								"totalFrames": 4,
								"startTime": 0,
								"loop": true
							}
						},
						{
							"type": "shader",
							"name": "AutoAlpha",
							"source": "shaders/AutoAlpha.hx",
							"enabled": false,
							"props": {
								"scale": 1
							}
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.580392156862745,
									0.4549019607843137,
									0.9921568627450981
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
								"progress": 0.3,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 1.5,
								"uvScaleY": 0.25,
								"texture": "Fx/Alphas/Dust05.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									-0.25,
									0
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "progress",
									"keys": [
										{
											"time": 0.08650383051484481,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5093725273045993,
												"dt": -0.5364309152591755
											},
											"nextHandle": {
												"dv": 0.03536535143684266,
												"dt": 0.038429033446780086
											}
										},
										{
											"time": 0.1318380500628833,
											"value": 0.35,
											"mode": 2
										},
										{
											"time": 0.1744522164380395,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.2259304181168038,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.33810931569266733,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.6,
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
								"progress": 0.3,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 1,
								"texture": "Fx/noise/T_Fire.png",
								"uvShift": [
									0,
									0.05
								],
								"uvShiftSpeed": [
									0,
									0.1
								]
							}
						},
						{
							"type": "curve",
							"name": "position.y",
							"keys": [
								{
									"time": 0,
									"value": -19,
									"mode": 2
								},
								{
									"time": 0.1,
									"value": 39,
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
									"time": 0.033596214511041014,
									"value": -1,
									"mode": 2
								},
								{
									"time": 0.065,
									"value": 5,
									"mode": 0,
									"prevHandle": {
										"dv": -0.033735795454546746,
										"dt": -0.01361001577287066
									},
									"nextHandle": {
										"dv": -4.481927875025472e-15,
										"dt": 0.016932698334359456
									}
								},
								{
									"time": 0.1,
									"value": -1,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "emitterSparks",
					"enabled": false,
					"props": {
						"lifeTime": 0.5,
						"alignLockAxis": "Z",
						"burstCount": 3,
						"instScale": 24,
						"instRotation_rand": [
							0,
							0,
							360
						],
						"instStretch_rand": [
							0,
							0,
							0
						],
						"instScale_rand": 0,
						"useRandomColor": true,
						"randomColor1": [
							1,
							0.7843137254901961,
							0.7843137254901961,
							1
						],
						"burstDelay": 0.2,
						"randomColor2": [
							0.8549019607843137,
							0.9490196078431372,
							0.996078431372549,
							1
						],
						"emitDuration": 1.3,
						"alignMode": "Screen",
						"emitRate": 1,
						"maxCount": 1,
						"emitType": "Burst"
					},
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"x": 1.1102230246251565e-16,
							"y": 6.938893903907228e-18,
							"scaleZ": 0.9999999999999999,
							"kind": 1,
							"args": [
								24,
								360,
								0,
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
											"colorMask": 255,
											"emissive": 30
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 1,
										"width": 0.83,
										"uvScaleX": 5,
										"uvScaleY": 0.125,
										"texture": "Fx/noise/T_Noise_DirectionalSparks02.png",
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
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
								"useSourceUVs": false,
								"useScale": true,
								"wrap": true,
								"progress": 0.82,
								"saturation": 1,
								"width": 0.8,
								"uvScaleX": 0.5,
								"uvScaleY": 0.5,
								"texture": "Fx/noise/T_Fire.png",
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
									"name": "width",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0.5350976805491343,
											"value": 0.9422222222222223,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.03695353771889259
											},
											"nextHandle": {
												"dv": -6.922428196740585e-16,
												"dt": 0.24478506621704163
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.5,
												"dt": -0.18500000000000005
											},
											"nextHandle": {
												"dv": -0.8474237452673484,
												"dt": 0.3135467857489186
											}
										},
										{
											"time": 2.0100000000000002,
											"value": 0,
											"mode": 0
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "emitRate",
							"enabled": false,
							"keyMode": 1,
							"keys": [
								{
									"time": 0.6793184979137693,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -1.047462182152558,
										"dt": -0.40958646044622943
									},
									"nextHandle": {
										"dv": 1.074807307466287,
										"dt": 0.4139597096662032
									}
								},
								{
									"time": 1.7527018223151543,
									"value": 2,
									"mode": 1,
									"prevHandle": {
										"dv": -0.02201704545454497,
										"dt": -0.321503771594684
									},
									"nextHandle": {
										"dv": -1.3152202317053487,
										"dt": 0
									}
								},
								{
									"time": 1.7627018223151543,
									"value": 0,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.8046360759493671,
									"value": 0,
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
						},
						{
							"type": "curve",
							"name": "instRotation.z",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1,
									"value": 30,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.3333333333333333
									},
									"nextHandle": {
										"dv": 0,
										"dt": -0.5
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