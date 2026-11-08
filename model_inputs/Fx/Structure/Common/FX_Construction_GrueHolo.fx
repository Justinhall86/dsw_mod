{
	"type": "fx",
	"duration": 120,
	"cullingRadius": 10,
	"children": [
		{
			"type": "object",
			"name": "group",
			"children": [
				{
					"type": "model",
					"name": "Cube_PivBot_2",
					"source": "Fx/Meshes_Common/Cube_PivBot.fbx",
					"scaleX": 0.2,
					"scaleY": 0.2,
					"scaleZ": 0.3,
					"rotationX": 90,
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
									"textureWrap": true,
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
								"useSourceUVs": false,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 0.1,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/Cyl05u_A.jpg"
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"enabled": false,
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.35,
								"saturation": 0,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 2,
								"texture": "Fx/Gradients/Cyl06u_A.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									-0.7
								],
								"uvScaleSpeed": [
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
											"time": 5,
											"value": 0,
											"mode": 2
										},
										{
											"time": 7.017420645654203,
											"value": 1,
											"mode": 2
										}
									]
								}
							],
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.5333333333333333,
									0.8,
									0.7803921568627451
								]
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "model",
					"name": "Cube_PivBot",
					"source": "Fx/Meshes_Common/Cube_PivBot.fbx",
					"scaleX": 0.2,
					"scaleY": 0.2,
					"scaleZ": 0.3,
					"rotationX": 90,
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
									"textureWrap": true,
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
								"useSourceUVs": false,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 0.1,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/Cyl05u_A.jpg"
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"enabled": false,
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.35,
								"saturation": 0,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 3,
								"texture": "Fx/Gradients/Cyl06u_A.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									-0.3
								],
								"uvScaleSpeed": [
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
											"time": 4.464465054273607,
											"value": 0,
											"mode": 2
										},
										{
											"time": 5.760186233818533,
											"value": 1,
											"mode": 2
										}
									]
								}
							],
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.5333333333333333,
									0.8,
									0.7803921568627451
								]
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "model",
					"name": "Cube_PivBot_3",
					"source": "Fx/Test/PyramidScan.fbx",
					"y": 0.01,
					"scaleX": 0.02,
					"scaleY": 0.02,
					"scaleZ": 0.02,
					"rotationY": -90,
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
									"textureWrap": true,
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
								"useSourceUVs": false,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 0.17,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/Gradient_Spotlight.png"
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
									0.5333333333333333,
									0.8,
									0.7803921568627451
								]
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "lookAt",
					"name": "lookAt_LightDrone",
					"x": 0.1,
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
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
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
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual"
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Flare01.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": -6.938893903907228e-18,
													"value": 0.033333333333333354,
													"mode": 2
												},
												{
													"time": 0.7,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4410989067285844,
													"value": 0.04999999999999999,
													"mode": 2
												}
											]
										}
									],
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8392156862745098,
											0.984313725490196,
											1
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
					"name": "lookAt_Light_1",
					"rotationY": -23,
					"rotationZ": 140.1,
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
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"rotationX": 0.1,
							"rotationY": 89.9,
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
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.3,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Flare04.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": -6.938893903907228e-18,
													"value": 0.033333333333333354,
													"mode": 2
												},
												{
													"time": 0.7,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4410989067285844,
													"value": 0.04999999999999999,
													"mode": 2
												}
											]
										}
									],
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8392156862745098,
											0.984313725490196,
											1
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
					"name": "lookAt_Light_2",
					"rotationY": -46,
					"rotationZ": 33.3,
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
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"rotationX": 0.1,
							"rotationY": 89.9,
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
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.3,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Flare04.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": -6.938893903907228e-18,
													"value": 0.033333333333333354,
													"mode": 2
												},
												{
													"time": 0.7,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4410989067285844,
													"value": 0.04999999999999999,
													"mode": 2
												}
											]
										}
									],
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8392156862745098,
											0.984313725490196,
											1
										]
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "curve",
					"name": "color.a",
					"keys": [
						{
							"time": 18.997327464870597,
							"value": 0,
							"mode": 2
						},
						{
							"time": 19.94517100129858,
							"value": 1,
							"mode": 2
						}
					]
				}
			]
		}
	]
}