{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "group",
			"props": {
				"tag": "TURN OFF BEFORE SAVE"
			},
			"children": [
				{
					"type": "model",
					"name": "CarryAll",
					"source": "Vehicle/Atreide/CarryAll/CarryAll.fbx"
				},
				{
					"type": "renderProps",
					"name": "renderProps",
					"props": {
						"PBR": {
							"mode": "Pbr",
							"emissive": 1,
							"exposure": 0,
							"sky": "Background",
							"tone": "Linear",
							"occlusion": 1,
							"shadows": true
						}
					},
					"children": [
						{
							"type": "rfx.temporalbloom",
							"name": "temporalbloom",
							"size": 0.5,
							"downScaleCount": 5,
							"threshold": 0.5,
							"maxValue": 100
						},
						{
							"type": "rfx.distortion",
							"name": "distortion"
						},
						{
							"type": "rfx.colorGrading",
							"name": "colorGrading"
						},
						{
							"type": "rfx.sao",
							"name": "sao",
							"blur": 5,
							"samples": 30,
							"radius": 1,
							"bias": 0.1
						},
						{
							"type": "rfx.sharpen",
							"name": "sharpen"
						}
					]
				},
				{
					"type": "polygon",
					"name": "polygon",
					"scaleX": 20,
					"scaleY": 20,
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
									"shadows": false,
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false,
									"culling": true,
									"textureWrap": true
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/noise/causticTexture_03-2 - Copie.png"
						},
						{
							"type": "shader",
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"shift": [
									0,
									0
								],
								"shiftSpeed": [
									0,
									0
								],
								"scale": [
									3,
									3
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "ColorMap",
							"source": "shaders/ColorMap.hx",
							"props": {
								"USE_ALPHA": false,
								"colorA": [
									0.6392156862745098,
									0.30196078431372547,
									0.12156862745098039
								],
								"pointA": 0,
								"colorB": [
									0.6588235294117647,
									0.43137254901960786,
									0.21176470588235294
								],
								"pointB": 1
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "light",
					"name": "light_0",
					"x": -1,
					"z": 5,
					"color": 16762243,
					"power": 0.3,
					"occlusionFactor": 1,
					"range": 30,
					"size": 3.07,
					"zNear": 0.02
				}
			],
			"enabled": false
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "group",
					"x": -2.86,
					"y": 1.85,
					"children": [
						{
							"type": "emitter",
							"name": "emitter - rings",
							"props": {
								"lifeTime": 0.6,
								"simulationSpace": "World",
								"instSpeed": [
									-2,
									0,
									0
								]
							},
							"x": 0.3500000000000001,
							"scaleX": 0.01,
							"scaleY": 0.010000000000000002,
							"scaleZ": 0.010000000000000002,
							"children": [
								{
									"type": "model",
									"name": "SM_Ring01",
									"source": "Fx/Meshes_Common/SM_Ring03_Cylinder.fbx",
									"scaleZ": 2,
									"rotationY": 90,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"culling": false
												}
											},
											"diffuseMap": "Fx/Gradients/Cyl03v_A.jpg"
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
															"time": 0.245,
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
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													1,
													1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0,
															"value": 3.1495915382948567,
															"mode": 2
														},
														{
															"time": 1,
															"value": 4.31493128480748,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"clampMax": 1,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"clampMax": 1,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.5,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": true,
												"ALPHA": false,
												"REVERSE": false,
												"bias": 0,
												"scale": 1,
												"power": 0.79,
												"color": [
													0,
													0,
													0
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keys": [
										{
											"time": 0,
											"value": 1.0333333333333337,
											"mode": 2
										},
										{
											"time": 0.135,
											"value": 1.2333333333333338,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.866666666666667,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter - small particles",
							"props": {
								"lifeTime": 0.3,
								"emitRate": 8,
								"simulationSpace": "World",
								"emitShape": "Box",
								"alignMode": "Screen",
								"instSpeed": [
									-4,
									0,
									0
								],
								"instScale": 0.1,
								"instRotation_rand": [
									0,
									0,
									360
								]
							},
							"x": 0.21,
							"scaleX": 0.53,
							"scaleY": 0.72,
							"scaleZ": 1.25,
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
													"blend": "Add",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"emissive": 1
												}
											},
											"diffuseMap": "Fx/Vehicle/Carryall/T_Square03.jpg"
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
															"time": 0.065,
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
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													1,
													1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0,
															"value": 3.1495915382948567,
															"mode": 2
														},
														{
															"time": 1,
															"value": 4.31493128480748,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"clampMax": 1,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"clampMax": 1,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.5,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Sphere",
							"source": "Fx/Meshes_Common/SphereIco.fbx",
							"x": 0.32,
							"scaleX": 0.4,
							"scaleY": 0.4,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"emissive": 1,
											"culling": true
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": true,
										"ALPHA": false,
										"REVERSE": false,
										"bias": 0.13,
										"scale": 1,
										"power": 0.69,
										"color": [
											0,
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
										"range": 0.1,
										"power": 1
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
										"tex": "Fx/noise/perlin1.jpg",
										"intensity": 0.1,
										"scrollSpeed": [
											0.1,
											0.1
										],
										"smoothEdge": 0
									},
									"isInstance": true
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
										"texture": "Fx/Vehicle/Carryall/T_DiskGrad03.jpg",
										"uvScale": [
											1,
											1
										],
										"uvDelta": [
											0,
											0
										]
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
											0,
											0.4196078431372549,
											0.7647058823529411
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "model",
							"name": "CrossTriPivTop_NoVrtx",
							"source": "Fx/Meshes_Common/CrossTriPivTop_NoVrtx.fbx",
							"x": 0.4,
							"scaleX": 1.4,
							"scaleY": 0.8,
							"scaleZ": 1.4,
							"rotationX": 180,
							"rotationY": -90,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "Distortion",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"wrapRepeat": true
								},
								{
									"type": "shader",
									"name": "DistortionMap",
									"source": "shaders/DistortionMap.hx",
									"props": {
										"distortionDir": "Fx/DistortionMaps/waveNormal2.jpg",
										"intensity": 0.01
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"shift": [
											0,
											0
										],
										"shiftSpeed": [
											0,
											-0.5
										],
										"scale": [
											1,
											2
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"texture": "Fx/Gradients/Cyl03v_A.jpg",
										"uvScale": [
											1,
											1
										],
										"uvDelta": [
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
										"uvScale": [
											1,
											1
										],
										"uvDelta": [
											0,
											0
										]
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.group",
					"target": "FXAnimation.group.CarryAll"
				}
			]
		}
	]
}