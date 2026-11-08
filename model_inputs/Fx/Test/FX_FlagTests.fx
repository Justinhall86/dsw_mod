{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
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
					"type": "model",
					"name": "Flag",
					"source": "Fx/Meshes_Common/CurvedPlan.fbx",
					"enabled": false,
					"z": 6.4909,
					"scaleX": 5,
					"scaleY": 8,
					"scaleZ": 0.87,
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
									"culling": "None",
									"colorMask": 255,
									"depthTest": "LessEqual",
									"enableStencil": false
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/water-normal.png"
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
								"alpha": 1.8,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/z_FillWhite.jpg",
								"onDecal": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "VertexDisplacement",
							"source": "shaders/VertexDisplacement.hx",
							"props": {
								"X": true,
								"Y": false,
								"Z": false,
								"texScaleX": 10,
								"texScaleY": 10,
								"tex": "Fx/Alphas/T_NukeVertex.png",
								"intensity": 8,
								"scrollSpeed": [
									0,
									0.1
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
									0.8313725490196078,
									0.8313725490196078,
									0.8313725490196078
								]
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "TestDrapeau",
					"y": -3.73194,
					"z": 19.22551,
					"children": [
						{
							"type": "polygon",
							"name": "07",
							"x": -1.16874,
							"y": 38.60083,
							"z": -6.12076,
							"scaleX": 8.000000000000002,
							"scaleY": 15.999999999999998,
							"scaleZ": 1.0000000000000002,
							"rotationX": -95.5,
							"rotationZ": -81.3,
							"kind": 0,
							"args": [
								8
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
											"enableStencil": false
										}
									},
									"diffuseMap": "Fx/Gradients/T_Flag_Albedo.png",
									"normalMap": "Fx/DistortionMaps/water-normal.png"
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
										"vScale": 0.99,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_FlagAlpha02.png",
										"onDecal": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": true,
										"Y": false,
										"Z": false,
										"texScaleX": 5,
										"texScaleY": 5,
										"tex": "Fx/Alphas/T_Flag_red.png",
										"intensity": 1.25,
										"scrollSpeed": [
											0,
											0.5
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 0.88,
										"color": [
											0.8509803921568627,
											0.803921568627451,
											0.7411764705882353
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "polygon",
							"name": "06",
							"y": 26.03914142857143,
							"z": -5.798755714285713,
							"scaleX": 8,
							"scaleY": 16,
							"rotationX": -89.99999999999999,
							"rotationZ": -89.99999999999999,
							"kind": 0,
							"args": [
								10
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
											"enableStencil": false
										}
									},
									"diffuseMap": "Fx/Gradients/T_Flag_Albedo.png",
									"normalMap": "Fx/DistortionMaps/water-normal.png"
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
										"vScale": 0.99,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_FlagAlpha.png",
										"onDecal": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": true,
										"Y": false,
										"Z": false,
										"texScaleX": 5,
										"texScaleY": 5,
										"tex": "Fx/Alphas/T_Flag_red.png",
										"intensity": 1,
										"scrollSpeed": [
											0,
											0.5
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 0.9,
										"color": [
											0.8509803921568627,
											0.803921568627451,
											0.7411764705882353
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "polygon",
							"name": "01",
							"enabled": false,
							"y": -23.78515857142857,
							"z": 21.506984285714285,
							"scaleX": 10,
							"scaleY": 16,
							"rotationY": 89.99999999999999,
							"kind": 0,
							"args": [
								10
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
											"enableStencil": false
										}
									},
									"diffuseMap": "Fx/Gradients/T_Flag_Albedo.png",
									"normalMap": "Fx/DistortionMaps/water-normal.png"
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
										"vScale": 0.99,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_FlagAlpha03.png",
										"onDecal": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"texScaleX": 5,
										"texScaleY": 1,
										"tex": "Fx/Alphas/T_Flag_red.png",
										"intensity": 2,
										"scrollSpeed": [
											0,
											-1
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 0.9,
										"color": [
											0.8509803921568627,
											0.803921568627451,
											0.7411764705882353
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "object",
							"name": "lookat_crap",
							"enabled": false,
							"x": -1.9949700000000001,
							"y": 61.73803,
							"z": -4.498249999999999,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"x": 2.45723,
									"y": -10.185690000000001,
									"scaleX": 1.0000000000000004,
									"scaleY": 1.0000000000000004,
									"rotationY": -32.68066699847962,
									"rotationZ": -163.8508737115491,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "07",
											"scaleX": 8,
											"scaleY": 16,
											"rotationX": -50,
											"rotationZ": 90,
											"kind": 0,
											"args": [
												8
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
															"enableStencil": false
														}
													},
													"diffuseMap": "Fx/Gradients/T_Flag_Albedo.png",
													"normalMap": "Fx/DistortionMaps/water-normal.png"
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
														"vScale": 0.99,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_FlagAlpha02.png",
														"onDecal": false
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "VertexDisplacement",
													"source": "shaders/VertexDisplacement.hx",
													"props": {
														"X": true,
														"Y": false,
														"Z": false,
														"texScaleX": 5,
														"texScaleY": 5,
														"tex": "Fx/Alphas/T_Flag_red.png",
														"intensity": 1,
														"scrollSpeed": [
															0,
															0.5
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 0.88,
														"color": [
															0.8509803921568627,
															0.803921568627451,
															0.7411764705882353
														]
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt",
									"x": -2.45723,
									"y": 10.185690000000008,
									"scaleX": 0.9999999999999993,
									"scaleY": 0.9999999999999996,
									"rotationX": -2.8306505576625387e-15,
									"rotationY": -32.57265202565701,
									"rotationZ": -160.61542240523048,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "01",
											"scaleX": 10,
											"scaleY": 16,
											"rotationY": 50,
											"rotationZ": 180,
											"kind": 0,
											"args": [
												10
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
															"enableStencil": false
														}
													},
													"diffuseMap": "Fx/Gradients/T_Flag_Albedo.png",
													"normalMap": "Fx/DistortionMaps/water-normal.png"
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
														"vScale": 0.99,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_FlagAlpha03.png",
														"onDecal": false
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "VertexDisplacement",
													"source": "shaders/VertexDisplacement.hx",
													"props": {
														"X": true,
														"Y": false,
														"Z": false,
														"texScaleX": 5,
														"texScaleY": 1,
														"tex": "Fx/Alphas/T_Flag_red.png",
														"intensity": 0.8,
														"scrollSpeed": [
															0,
															-1
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 0.9,
														"color": [
															0.8509803921568627,
															0.803921568627451,
															0.7411764705882353
														]
													},
													"isInstance": true
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt01",
							"x": 10.71841,
							"y": -1.46646,
							"z": 16.66296,
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "01",
									"scaleX": 10.000000000000004,
									"scaleY": 16.000000000000007,
									"scaleZ": 1.0000000000000007,
									"rotationX": -1.25,
									"rotationY": 40,
									"rotationZ": -180,
									"kind": 0,
									"args": [
										10
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
													"enableStencil": false
												}
											},
											"diffuseMap": "Fx/Gradients/T_Flag_Albedo.png",
											"normalMap": "Fx/DistortionMaps/water-normal.png"
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
												"vScale": 0.99,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_FlagAlpha03.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 5,
												"texScaleY": 1,
												"tex": "Fx/Alphas/T_Flag_red.png",
												"intensity": 1,
												"scrollSpeed": [
													0,
													-1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.9,
												"color": [
													0.8509803921568627,
													0.803921568627451,
													0.7411764705882353
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt02",
							"x": 10.71841,
							"y": -1.46646,
							"z": 16.66296,
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "02",
									"x": -10.03155,
									"y": -2.09502,
									"z": -8.47476,
									"scaleX": 8.000000000000002,
									"scaleY": 20,
									"scaleZ": 0.9999999999999994,
									"rotationX": -1.25,
									"rotationY": 40,
									"rotationZ": -180,
									"kind": 0,
									"args": [
										10
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
													"enableStencil": false
												}
											},
											"diffuseMap": "Fx/Gradients/T_Flag_Albedo.png",
											"normalMap": "Fx/DistortionMaps/water-normal.png"
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
												"vScale": 0.99,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_FlagAlpha03.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 5,
												"texScaleY": 1,
												"tex": "Fx/Alphas/T_Flag_red.png",
												"intensity": 1,
												"scrollSpeed": [
													0,
													-1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.9,
												"color": [
													0.8509803921568627,
													0.803921568627451,
													0.7411764705882353
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt03",
							"x": 10.92555,
							"y": 21.83414,
							"z": 13.48342,
							"rotationY": -5.9,
							"rotationZ": 178.8,
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "03",
									"scaleX": 12,
									"scaleY": 13,
									"rotationX": -1.25,
									"rotationY": 40,
									"rotationZ": -180,
									"kind": 0,
									"args": [
										10
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
													"enableStencil": false
												}
											},
											"diffuseMap": "Fx/Gradients/T_Flag_Albedo.png",
											"normalMap": "Fx/DistortionMaps/water-normal.png"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 5,
												"texScaleY": 1,
												"tex": "Fx/Alphas/T_Flag_red.png",
												"intensity": 0.8,
												"scrollSpeed": [
													0,
													-1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.9,
												"color": [
													0.8509803921568627,
													0.803921568627451,
													0.7411764705882353
												]
											},
											"isInstance": true
										},
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
													"enableStencil": false
												}
											},
											"diffuseMap": "Fx/Gradients/T_Flag_Albedo.png",
											"normalMap": "Fx/DistortionMaps/water-normal.png"
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt04",
							"x": 15.651,
							"y": -27.16925,
							"z": 15.00698,
							"rotationY": -15.2,
							"rotationZ": 168.3,
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "04",
									"scaleX": 10,
									"scaleY": 13,
									"rotationX": -1.25,
									"rotationY": 40,
									"rotationZ": -180,
									"kind": 0,
									"args": [
										10
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
													"enableStencil": false
												}
											},
											"diffuseMap": "Fx/Gradients/T_Flag_Albedo.png",
											"normalMap": "Fx/DistortionMaps/water-normal.png"
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
												"vScale": 0.99,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_FlagAlpha.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 5,
												"texScaleY": 1,
												"tex": "Fx/Alphas/T_Flag_red.png",
												"intensity": 0.8,
												"scrollSpeed": [
													0,
													-1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.8,
												"color": [
													0.8509803921568627,
													0.803921568627451,
													0.7411764705882353
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt05",
							"x": 14.19221,
							"y": -26.13836,
							"z": 5.17687,
							"rotationY": -18.8,
							"rotationZ": -71.2,
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "05",
									"scaleX": 10,
									"scaleY": 14,
									"rotationX": -1.25,
									"rotationY": 40,
									"rotationZ": -180,
									"kind": 0,
									"args": [
										10
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
													"enableStencil": false
												}
											},
											"diffuseMap": "Fx/Gradients/T_Flag_Albedo.png",
											"normalMap": "Fx/DistortionMaps/water-normal.png"
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
												"vScale": 0.99,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_FlagAlpha02.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 5,
												"texScaleY": 1,
												"tex": "Fx/Alphas/T_Flag_red.png",
												"intensity": 0.8,
												"scrollSpeed": [
													0,
													-1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.9,
												"color": [
													0.8509803921568627,
													0.803921568627451,
													0.7411764705882353
												]
											},
											"isInstance": true
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "CurvedPlan",
					"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
					"enabled": false,
					"x": -1.64906,
					"y": -0.04318,
					"z": 10.04875,
					"scaleX": 5,
					"scaleY": 10,
					"scaleZ": 5,
					"rotationY": 180,
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
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 1,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/circGrad01.png",
								"onDecal": false
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
								"progress": 0.24,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 2,
								"texture": "Fx/noise/Wave_01.jpg",
								"uvShift": [
									1,
									5
								],
								"uvShiftSpeed": [
									0,
									-0.5
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
								"progress": 0.7,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 0.5,
								"texture": "Fx/noise/perlin06.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0.1
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
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.4,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 0.7,
								"power": 1
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}