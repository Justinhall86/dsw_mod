{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "NukeSilo",
					"source": "Structure/Buildings/NukeSilo/NukeSilo.fbx",
					"editorOnly": true,
					"scaleX": 10,
					"scaleY": 10,
					"scaleZ": 10,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Structure/Buildings/NukeSilo/Anim_NukeSilo_Loading.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "TopLights",
					"y": 0.3408,
					"rotationX": -90,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"y": 0.62888,
							"scaleX": 0.34,
							"scaleY": 0.34,
							"scaleZ": 0.34,
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
											"colorMask": 255,
											"emissive": 1,
											"alphaKill": true,
											"drawOrder": "100"
										}
									},
									"diffuseMap": "Fx/Alphas/NukeSilo_Lights.png"
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
											0.8627450980392157,
											0.30980392156862746,
											0.00784313725490196
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"enabled": false,
									"props": {
										"minAlpha": 0,
										"maxAlpha": 1,
										"frequency": 0.5
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"x": 0.54498,
							"y": -0.31363,
							"scaleX": 0.34,
							"scaleY": 0.34,
							"scaleZ": 0.34,
							"rotationZ": -120,
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
											"colorMask": 255,
											"emissive": 1,
											"alphaKill": true,
											"drawOrder": "100"
										}
									},
									"diffuseMap": "Fx/Alphas/NukeSilo_Lights.png"
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
											0.8627450980392157,
											0.30980392156862746,
											0.00784313725490196
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"enabled": false,
									"props": {
										"minAlpha": 0,
										"maxAlpha": 1,
										"frequency": 0.5
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"x": -0.54771,
							"y": -0.3162,
							"scaleX": 0.34,
							"scaleY": 0.34,
							"scaleZ": 0.34,
							"rotationZ": 120,
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
											"colorMask": 255,
											"emissive": 1,
											"alphaKill": true,
											"drawOrder": "100"
										}
									},
									"diffuseMap": "Fx/Alphas/NukeSilo_Lights.png"
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
											0.8627450980392157,
											0.30980392156862746,
											0.00784313725490196
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"enabled": false,
									"props": {
										"minAlpha": 0,
										"maxAlpha": 1,
										"frequency": 0.5
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				},
				{
					"type": "object",
					"name": "TowerLights",
					"rotationX": -90,
					"children": [
						{
							"type": "object",
							"name": "Tower1",
							"y": 0.82349,
							"z": 0.0241,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"y": 3.3306690738754696e-16,
									"z": 0.1486839999999999,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": 0.07176399999999997,
									"scaleX": 0.08999999999999998,
									"scaleY": 0.049999999999999996,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"y": 1.1102230246251565e-16,
									"z": -0.002606000000000025,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": -0.07162600000000001,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"y": 2.220446049250313e-16,
									"z": -0.146216,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Tower1-1",
							"y": 0.4487,
							"z": 0.0241,
							"rotationZ": 180,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"y": 3.3306690738754696e-16,
									"z": 0.1486839999999999,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": 0.07176399999999997,
									"scaleX": 0.08999999999999998,
									"scaleY": 0.049999999999999996,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"y": 1.1102230246251565e-16,
									"z": -0.002606000000000025,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": -0.07162600000000001,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Tower2",
							"x": 0.71338,
							"y": -0.41086,
							"z": 0.0241,
							"rotationZ": -120,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"y": 3.3306690738754696e-16,
									"z": 0.1486839999999999,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": 0.07176399999999997,
									"scaleX": 0.08999999999999998,
									"scaleY": 0.049999999999999996,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"y": 1.1102230246251565e-16,
									"z": -0.002606000000000025,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": -0.07162600000000001,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"y": 2.220446049250313e-16,
									"z": -0.146216,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Tower2-2",
							"x": 0.38873,
							"y": -0.22342,
							"z": 0.0241,
							"rotationZ": 60,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"y": 3.3306690738754696e-16,
									"z": 0.1486839999999999,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": 0.07176399999999997,
									"scaleX": 0.08999999999999998,
									"scaleY": 0.049999999999999996,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"y": 1.1102230246251565e-16,
									"z": -0.002606000000000025,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": -0.07162600000000001,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Tower3",
							"x": -0.71515,
							"y": -0.41051,
							"z": 0.0241,
							"rotationZ": 120,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"y": 3.3306690738754696e-16,
									"z": 0.1486839999999999,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": 0.07176399999999997,
									"scaleX": 0.08999999999999998,
									"scaleY": 0.049999999999999996,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"y": 1.1102230246251565e-16,
									"z": -0.002606000000000025,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": -0.07162600000000001,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"y": 2.220446049250313e-16,
									"z": -0.146216,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Tower3-2",
							"x": -0.38339,
							"y": -0.22273,
							"z": 0.0241,
							"rotationZ": -60,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"y": 3.3306690738754696e-16,
									"z": 0.1486839999999999,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": 0.07176399999999997,
									"scaleX": 0.08999999999999998,
									"scaleY": 0.049999999999999996,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"y": 1.1102230246251565e-16,
									"z": -0.002606000000000025,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": -0.07162600000000001,
									"scaleX": 0.08999999999999997,
									"scaleY": 0.05,
									"scaleZ": 0.08999999999999998,
									"rotationX": -89.99999999999999,
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
													"colorMask": 255,
													"emissive": 1,
													"alphaKill": true,
													"drawOrder": "100"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8627450980392157,
													0.30980392156862746,
													0.00784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.TopLights",
					"target": "FXAnimation.FXRoot.NukeSilo.root.B_ROOT.B_HighPillars"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.TowerLights",
					"target": "FXAnimation.FXRoot.NukeSilo.root.B_ROOT.B_HighPillars"
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
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.02110576683273151,
										"dt": -0.49995994713014763
									},
									"nextHandle": {
										"dv": -0.02110576683273151,
										"dt": 0.49995994713014763
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.7334825383614402,
										"dt": -0.27881377551020414
									},
									"nextHandle": {
										"dv": 0.6846954662938333,
										"dt": 0.2626023887741453
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