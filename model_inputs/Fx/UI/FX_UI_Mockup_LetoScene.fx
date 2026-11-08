{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "emitter",
					"name": "Dust",
					"props": {
						"lifeTime": 8,
						"lifeTimeRand": 5,
						"emitShape": "Box",
						"alignMode": "Screen",
						"instScale": 0.01,
						"instScale_rand": 0.004,
						"instSpeed_rand": [
							0.02,
							0.02,
							0.02
						],
						"warmUpTime": 10,
						"emitRate": 25,
						"maxCount": 125,
						"useRandomColor": true,
						"randomColor1": [
							1,
							0.5529411764705883,
							0.3176470588235294,
							1
						],
						"randomColor2": [
							0.996078431372549,
							0.9098039215686274,
							0.5490196078431373,
							0.6941176470588235
						],
						"instSpeed": [
							0,
							0,
							-0.03
						]
					},
					"x": -0.94299,
					"y": -0.92452,
					"z": 1.29184,
					"scaleX": 0.9,
					"scaleY": 1.15,
					"scaleZ": 2.15,
					"rotationY": 47.6,
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
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 1
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
										"alpha": 1.2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle4.png"
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
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Dust",
					"props": {
						"lifeTime": 8,
						"lifeTimeRand": 5,
						"emitShape": "Box",
						"alignMode": "Screen",
						"instScale": 0.015,
						"instScale_rand": 0.01,
						"instSpeed_rand": [
							0.02,
							0.02,
							0.02
						],
						"warmUpTime": 10,
						"emitRate": 10,
						"useRandomColor": true,
						"randomColor1": [
							0.5411764705882353,
							0.2784313725490196,
							0.13725490196078433,
							1
						],
						"randomColor2": [
							0.7058823529411764,
							0.49411764705882355,
							0.24705882352941178,
							1
						],
						"frameCount": 4,
						"frameDivisionX": 2,
						"frameDivisionY": 2,
						"animationSpeed": 0,
						"spriteSheet": "Fx/Alphas/T_DustParticles02.png",
						"maxCount": 40
					},
					"x": 0.15212,
					"y": 0.41704,
					"z": 1.63887,
					"scaleX": 0.7,
					"scaleY": 0.42,
					"scaleZ": 0.69,
					"rotationX": 19.1,
					"rotationY": 30,
					"rotationZ": -32.4,
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
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 1
										}
									},
									"wrapRepeat": true,
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.5411764705882353,
											0.36470588235294116,
											0.13725490196078433
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Leto",
					"source": "Character/Atreide/Leader/Leto/Leto.fbx",
					"editorOnly": true,
					"x": -0.08,
					"y": 0.08,
					"rotationZ": 150
				},
				{
					"type": "object",
					"name": "RightCorner",
					"x": 0.60357,
					"y": -1.93422,
					"z": 2.35877,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"scaleY": 0.9999999999999998,
							"rotationX": 8.206873585902934e-16,
							"rotationY": -14.3339607291465,
							"rotationZ": 45.64245228461301,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon_Circle",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
									"rotationY": 90,
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
												"texture": "Fx/Alphas/T_UI_Circle_1.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.43137254901960786,
													0.2196078431372549,
													0.10588235294117647
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 150,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon_Circle",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
									"rotationX": -90,
									"rotationY": 76,
									"rotationZ": -90,
									"kind": 1,
									"args": [
										56,
										360,
										0.3,
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
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"textureWrap": true
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
												"uScale": 6,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Line_1.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.43137254901960786,
													0.2196078431372549,
													0.10588235294117647
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 250,
													"value": 1,
													"mode": 2
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
												"progress": 0.89,
												"saturation": 1,
												"width": 0.88,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/Gradients/Cyl03v_A.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.09,
													0
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon_Circle",
									"enabled": false,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"rotationX": -90,
									"rotationY": 76,
									"rotationZ": -90,
									"kind": 1,
									"args": [
										56,
										360,
										0.3,
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
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"textureWrap": true
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
												"alpha": 0.5,
												"uScale": 6,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Line_1.png"
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
													0.7607843137254902,
													0.6274509803921569
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 150,
													"value": 1,
													"mode": 2
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
												"progress": 0.89,
												"saturation": 1,
												"width": 0.88,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/Gradients/Cyl03v_A.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.2,
													0
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon_Dots",
									"scaleX": 1.275,
									"scaleY": 1.275,
									"scaleZ": 1.275,
									"rotationY": 90,
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
												"alpha": 0.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Circle_Dots.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.43137254901960786,
													0.2196078431372549,
													0.10588235294117647
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1000,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon_DottedLines",
									"rotationY": 90,
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
												"alpha": 0.8,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Circle_DottedLines.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.43137254901960786,
													0.2196078431372549,
													0.10588235294117647
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 250,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Disk_StraightUVs",
									"source": "Fx/Meshes_Common/Ring_5.fbx",
									"enabled": false,
									"scaleX": 0.7,
									"scaleY": 0.7,
									"rotationY": 90,
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
												"alpha": 0.4,
												"uScale": 4,
												"vScale": 0.25,
												"uOffset": 0,
												"vOffset": 0.3,
												"texture": "Fx/Alphas/T_UI_Line_1.png"
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
													0.7607843137254902,
													0.6274509803921569
												]
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
												"progress": 0.89,
												"saturation": 1,
												"width": 0.88,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/Gradients/Cyl03v_A.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.2,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.x",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 150,
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
							"type": "lookAt",
							"name": "lookAt",
							"scaleY": 0.9999999999999998,
							"rotationX": 8.206873585902934e-16,
							"rotationY": -14.3339607291465,
							"rotationZ": 45.64245228461301,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon_DottedLines",
									"x": -2.220446049250313e-16,
									"scaleX": 0.625,
									"scaleY": 0.625,
									"scaleZ": 0.625,
									"rotationX": 89.99999999999999,
									"rotationY": 46.332658481507146,
									"rotationZ": 89.99999999999999,
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
												"alpha": 0.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Circle_DottedLines.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.43137254901960786,
													0.2196078431372549,
													0.10588235294117647
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 500,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon_2",
									"scaleX": 0.7,
									"scaleY": 0.7,
									"scaleZ": 0.7,
									"rotationX": 45,
									"rotationY": 90,
									"rotationZ": 45,
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
												"texture": "Fx/Alphas/T_UI_Circle_1.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.43137254901960786,
													0.2196078431372549,
													0.10588235294117647
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 75,
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
					"name": "LeftCorner",
					"x": -1.15257,
					"y": 0.18683,
					"z": 1.30219,
					"scaleX": 0.85,
					"scaleY": 0.85,
					"scaleZ": 0.85,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"x": -0.00216,
							"y": 0.00658,
							"z": -0.0516,
							"scaleX": 0.4999999999999999,
							"scaleY": 0.4999999999999999,
							"scaleZ": 0.5,
							"rotationY": -7.6,
							"rotationZ": 108.2,
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
									"enabled": false,
									"y": 0.16064,
									"z": -0.70856,
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
									"rotationY": 90,
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Form_1.png"
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
													0.7607843137254902,
													0.6274509803921569
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
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/dGrad05.png",
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
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "rotation.x",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 150,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon - line1",
									"y": 0.10793,
									"z": -0.65242,
									"scaleX": 2,
									"scaleY": 0.5,
									"scaleZ": 1.2,
									"rotationX": -90,
									"rotationY": 45,
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
												"alpha": 0.75,
												"uScale": 1,
												"vScale": 0.25,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_WoblyLines.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.43137254901960786,
													0.2196078431372549,
													0.10588235294117647
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon - line1",
									"y": 0.10793,
									"z": -0.65242,
									"scaleX": 2,
									"scaleY": 0.5,
									"scaleZ": 1.2,
									"rotationX": -90,
									"rotationY": 45,
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
												"vScale": 0.25,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_WoblyLines.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.43137254901960786,
													0.2196078431372549,
													0.10588235294117647
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
												"progress": 0.27,
												"saturation": 1,
												"width": 0.45,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl05v_A.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.25,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5,
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
									"name": "polygon - Dottedline1",
									"y": 0.19903,
									"z": -0.74352,
									"scaleX": 2,
									"scaleY": 0.5,
									"scaleZ": 1.2,
									"rotationX": -90,
									"rotationY": 45,
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
												"vScale": 0.25,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_WoblyLines_DottedLines.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.43137254901960786,
													0.2196078431372549,
													0.10588235294117647
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
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/dGrad05.png",
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
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 10,
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
									"name": "polygon - Dottedline2",
									"enabled": false,
									"x": -0.00647,
									"y": 0.29092,
									"z": -0.88562,
									"scaleX": 2,
									"scaleY": 0.5,
									"scaleZ": 1.2,
									"rotationX": -90,
									"rotationY": 45,
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
												"alpha": 0.6,
												"uScale": 1,
												"vScale": 0.25,
												"uOffset": 0,
												"vOffset": -0.75,
												"texture": "Fx/Alphas/T_UI_WoblyLines.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.43137254901960786,
													0.2196078431372549,
													0.10588235294117647
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
												"progress": 0.44,
												"saturation": 1,
												"width": 0.62,
												"uvScaleX": 50,
												"uvScaleY": 50,
												"texture": "Fx/Alphas/Pointille.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.02,
													0
												]
											}
										}
									]
								},
								{
									"type": "object",
									"name": "Line2",
									"x": -0.006469999999999976,
									"y": 0.3166199999999999,
									"z": -0.9113200000000004,
									"rotationX": -8.01576287147927e-20,
									"rotationY": 1.987846675914698e-16,
									"rotationZ": 1.171894436484634e-17,
									"children": [
										{
											"type": "polygon",
											"name": "polygon - line2",
											"y": -4.440892098500626e-16,
											"z": 8.881784197001252e-16,
											"scaleX": 1.9999999999999996,
											"scaleY": 0.49999999999999994,
											"scaleZ": 1.2,
											"rotationX": -89.99999999999999,
											"rotationY": 45.00000000000001,
											"rotationZ": -89.99999999999999,
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
														"alpha": 0.7,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": -0.75,
														"texture": "Fx/Alphas/T_UI_WoblyLines.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.43137254901960786,
															0.2196078431372549,
															0.10588235294117647
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
														"progress": 0.27,
														"saturation": 1,
														"width": 0.43,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl01v_A.png",
														"uvShift": [
															0.2,
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
															"name": "progress",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 5,
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
											"name": "polygon - line2",
											"y": -4.440892098500626e-16,
											"z": 8.881784197001252e-16,
											"scaleX": 1.9999999999999996,
											"scaleY": 0.49999999999999994,
											"scaleZ": 1.2,
											"rotationX": -89.99999999999999,
											"rotationY": 45.00000000000001,
											"rotationZ": -89.99999999999999,
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
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": -0.75,
														"texture": "Fx/Alphas/T_UI_WoblyLines.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.43137254901960786,
															0.2196078431372549,
															0.10588235294117647
														]
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Line3",
									"x": 2.220446049250313e-16,
									"y": 0.43660999999999994,
									"z": -1.1019800000000004,
									"rotationX": -8.01576287147927e-20,
									"rotationY": 1.987846675914698e-16,
									"rotationZ": 1.171894436484634e-17,
									"children": [
										{
											"type": "polygon",
											"name": "polygon - line3",
											"x": -2.220446049250313e-16,
											"y": -4.440892098500626e-16,
											"z": 6.661338147750939e-16,
											"scaleX": 1.9999999999999996,
											"scaleY": 0.49999999999999994,
											"scaleZ": 1.2,
											"rotationX": -89.99999999999999,
											"rotationY": 45.00000000000001,
											"rotationZ": -89.99999999999999,
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
														"alpha": 0.6,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": -0.5,
														"texture": "Fx/Alphas/T_UI_WoblyLines.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.43137254901960786,
															0.2196078431372549,
															0.10588235294117647
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon - line3",
											"x": -2.220446049250313e-16,
											"y": -4.440892098500626e-16,
											"z": 6.661338147750939e-16,
											"scaleX": 1.9999999999999996,
											"scaleY": 0.49999999999999994,
											"scaleZ": 1.2,
											"rotationX": -89.99999999999999,
											"rotationY": 45.00000000000001,
											"rotationZ": -89.99999999999999,
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
														"alpha": 0.95,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": -0.5,
														"texture": "Fx/Alphas/T_UI_WoblyLines.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.43137254901960786,
															0.2196078431372549,
															0.10588235294117647
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
														"progress": 0.27,
														"saturation": 1,
														"width": 0.3,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05v_A.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.15,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 5,
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
									"type": "polygon",
									"name": "polygon - Dottedline3",
									"y": 0.5044,
									"z": -1.16977,
									"scaleX": 2,
									"scaleY": 0.5,
									"scaleZ": 1.2,
									"rotationX": -90,
									"rotationY": 45,
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
												"alpha": 0.6,
												"uScale": 1,
												"vScale": 0.25,
												"uOffset": 0,
												"vOffset": -0.5,
												"texture": "Fx/Alphas/T_UI_WoblyLines_DottedLines.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.43137254901960786,
													0.2196078431372549,
													0.10588235294117647
												]
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
								"alpha": 0.8
							}
						}
					]
				},
				{
					"type": "light",
					"name": "Main_Light_0",
					"editorOnly": true,
					"x": 0.01,
					"y": 1.5,
					"z": 2.08,
					"rotationX": 3,
					"rotationY": 12.8,
					"rotationZ": -93.1,
					"kind": "Spot",
					"color": 16772306,
					"power": 1.74,
					"range": 3.16,
					"zNear": 0.02,
					"angle": 39.43,
					"fallOff": 15.68,
					"shadows": {
						"mode": "Dynamic",
						"size": 2048,
						"radius": 0,
						"quality": 1,
						"bias": 0.001,
						"samplingMode": {
							"kind": "None"
						}
					}
				},
				{
					"type": "object",
					"name": "Godrays",
					"x": 0.27956,
					"y": -1.22761,
					"z": 2.7018500000000003,
					"children": [
						{
							"type": "object",
							"name": "Godray",
							"x": -0.39428,
							"y": -0.17095,
							"z": 0.01274,
							"scaleX": 0.85,
							"scaleY": 0.85,
							"scaleZ": 0.85,
							"rotationX": -70.2,
							"rotationY": 41.8,
							"rotationZ": -7.9,
							"children": [
								{
									"type": "model",
									"name": "SM_GodRayPlane01",
									"source": "Fx/UI/SM_GodRayPlane01.fbx",
									"y": 0.45156,
									"z": -0.26015,
									"scaleX": 100,
									"scaleY": 125,
									"scaleZ": 50,
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
													"textureWrap": true,
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
												"texture": "Fx/Alphas/RaysDissolve_02_1024.png"
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
												"texture": "Fx/Gradients/T_Square03_1024.jpg.png"
											}
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
												"shiftSpeedX": 0.01,
												"shiftSpeedY": 0,
												"USE_SOURCE_UV": true
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
												"progress": 0.3,
												"saturation": 0.65,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/RaysDissolve_09_1024.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.03,
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
												"progress": 0.5,
												"saturation": 1,
												"width": 0.68,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/dGrad04.png",
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
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.5
											}
										},
										{
											"type": "shader",
											"name": "ColorMap",
											"source": "shaders/ColorMap.hx",
											"props": {
												"USE_ALPHA": true,
												"colorA": [
													0.9294117647058824,
													0.8549019607843137,
													0.6784313725490196
												],
												"pointA": 0.49,
												"colorB": [
													0.6509803921568628,
													0.30980392156862746,
													0.1411764705882353
												],
												"pointB": 0
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
	]
}