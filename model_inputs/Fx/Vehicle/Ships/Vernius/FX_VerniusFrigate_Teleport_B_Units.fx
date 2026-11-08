{
	"type": "fx",
	"duration": 3.5,
	"cullingRadius": 1000,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 500,
			"scaleY": 500,
			"scaleZ": 500,
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
							"blend": "None",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false
						}
					},
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png",
					"refMatLib": ""
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.55,
			"scaleY": 0.55,
			"scaleZ": 0.55,
			"children": [
				{
					"type": "object",
					"name": "units",
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "model",
							"name": "RailgunMESH",
							"source": "Vehicle/Vernius/DroneRailGun/DroneRailGun.fbx",
							"enabled": false,
							"editorOnly": true,
							"y": -2.42116,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"enabled": false,
									"animation": "Anim/Siren/Anim_Siren_Run.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "suboid",
							"source": "Character/Vernius/Unit/Suboid/Male01_Suboid.fbx",
							"editorOnly": true,
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"enabled": false,
									"animation": "Anim/Siren/Anim_Siren_Run.fbx"
								},
								{
									"type": "material",
									"name": "material",
									"enabled": false,
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
											1,
											0,
											0
										]
									}
								}
							]
						},
						{
							"type": "object",
							"name": "Appear",
							"children": [
								{
									"type": "object",
									"name": "Circle",
									"z": 0.1,
									"children": [
										{
											"type": "polygon",
											"name": "TestBobineIridescentPurpleOK",
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
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
															"drawOrder": "100",
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"refMatLib": ""
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.31,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/glow (129).png",
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
																	"time": 0.3988522238163558,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.0563113558750326,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0026192752475185377,
																		"dt": -1.2622530545170965
																	},
																	"nextHandle": {
																		"dv": -0.0002133911585406001,
																		"dt": 0.09693640999815065
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
													"keys": [
														{
															"time": 0.1526843373220377,
															"value": 0.004783363236627203,
															"mode": 0,
															"prevHandle": {
																"dv": -0.7858060700381525,
																"dt": -0.08074978007894783
															},
															"nextHandle": {
																"dv": 2.967195628554196,
																"dt": 0.3036709244144016
															}
														},
														{
															"time": 0.6591798225081901,
															"value": 3,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0064309020734008016,
																"dt": -0.39116165291694815
															},
															"nextHandle": {
																"dv": -1.594567953166881e-16,
																"dt": 0.261785888613747
															}
														},
														{
															"time": 2.1425391994428433,
															"value": 3,
															"mode": 1,
															"prevHandle": {
																"dv": -0.0007350052426389198,
																"dt": -0.6238317412634897
															},
															"nextHandle": {
																"dv": -0.0007350052426389198,
																"dt": 1.65720187755492
															}
														}
													]
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
															"keys": [
																{
																	"time": 0.3988522238163558,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.5971723026634657,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0026192752475185377,
																		"dt": -1.2622530545170965
																	},
																	"nextHandle": {
																		"dv": -0.0002133911585406001,
																		"dt": 0.09693640999815065
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
															0.6196078431372549,
															0.38823529411764707,
															0.8588235294117647
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
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								},
								{
									"type": "object",
									"name": "Decal",
									"z": 2.31677,
									"children": [
										{
											"type": "advancedDecal",
											"name": "advancedDecal",
											"z": 0.49999999999999956,
											"scaleX": 8.8,
											"scaleY": 8.8,
											"scaleZ": 8.8,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"renderMode": "BeforeTonemapping",
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
															"emissive": 2
														}
													},
													"refMatLib": ""
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.2626750515771328,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.2864394328296088,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.7997434902385065,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.003954335105800066,
																"dt": -0.47936687087130886
															},
															"nextHandle": {
																"dv": -0.004264020316916277,
																"dt": 0.499978567907575
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.2626750515771328,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.2864394328296088,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.7997434902385065,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.048924924419795734,
																"dt": -0.5237526922482818
															},
															"nextHandle": {
																"dv": -0.046593646788494564,
																"dt": 0.4974344186453122
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
													0.6196078431372549,
													0.38823529411764707,
													0.8588235294117647
												]
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