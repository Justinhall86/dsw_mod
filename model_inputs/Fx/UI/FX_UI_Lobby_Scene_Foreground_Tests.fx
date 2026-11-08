{
	"type": "fx",
	"cullingRadius": 100,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Pulse",
					"enabled": false,
					"scaleX": 1.17,
					"scaleY": 1.17,
					"scaleZ": 1.17,
					"children": [
						{
							"type": "object",
							"name": "PulseSmall",
							"scaleX": 1.08,
							"scaleY": 1.08,
							"scaleZ": 1.1,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"rotationX": 1.6721165498415313e-15,
									"rotationY": -18,
									"rotationZ": 44.6562253229215,
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
														"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.32624999999999993,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 0.8262499999999999,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 1.32625,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 300,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -50
															},
															"nextHandle": {
																"dv": 0,
																"dt": 50
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.3262500000000004,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.08333333333333331
															}
														},
														{
															"time": 0.8262500000000004,
															"value": 0.98,
															"mode": 0,
															"prevHandle": {
																"dv": 4.060759950527971e-18,
																"dt": -0.2238206941393043
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.254375
															}
														},
														{
															"time": 1.3262500000000004,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08333333333333333
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3499999999999999
															}
														},
														{
															"time": 6,
															"value": 0.95,
															"mode": 0
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
									"enabled": false,
									"props": {
										"alpha": 1
									}
								}
							]
						},
						{
							"type": "object",
							"name": "PulseBig",
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleY": 0.9999999999999999,
									"rotationX": 1.6841764469393999e-15,
									"rotationY": -19.222652143119696,
									"rotationZ": 44.6562253229215,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon_2",
											"rotationX": -89.99999999999997,
											"rotationY": -26.323708890336036,
											"rotationZ": -90.00000000000004,
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
														"alpha": 0.9,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_2_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.2318749999999987,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 1.7318749999999987,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.169999999999998,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
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
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 1.2318749999999987,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.08333333333333331
															}
														},
														{
															"time": 1.7318749999999987,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 4.060759950527971e-18,
																"dt": -0.2238206941393043
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.254375
															}
														},
														{
															"time": 2.169999999999998,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08333333333333333
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3499999999999999
															}
														},
														{
															"time": 6,
															"value": 0.95,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon_DottedLines",
											"scaleX": 1.11,
											"scaleY": 1.11,
											"scaleZ": 1.11,
											"rotationX": -7.061204112370308e-15,
											"rotationY": 89.568,
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
														"texture": "Fx/Alphas/T_UI_Circle_DottedLines_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.400624999999998,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 1.900624999999998,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.3893749999999967,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
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
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 1.3387499999999983,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.08333333333333331
															}
														},
														{
															"time": 1.8387499999999983,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 4.060759950527971e-18,
																"dt": -0.2238206941393043
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.254375
															}
														},
														{
															"time": 2.327499999999997,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08333333333333333
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3499999999999999
															}
														},
														{
															"time": 6,
															"value": 0.95,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon_Circle",
											"scaleX": 1.22,
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
														"alpha": 0.6,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_1_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.5918749999999982,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 2.0299999999999976,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.535624999999997,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 300,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -50
															},
															"nextHandle": {
																"dv": 0,
																"dt": 50
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 1.451249999999999,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.08333333333333331
															}
														},
														{
															"time": 1.8893749999999985,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 4.060759950527971e-18,
																"dt": -0.2238206941393043
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.254375
															}
														},
														{
															"time": 2.394999999999998,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08333333333333333
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3499999999999999
															}
														},
														{
															"time": 6,
															"value": 0.95,
															"mode": 0
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
									"enabled": false,
									"props": {
										"alpha": 1
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.75
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Test3",
					"enabled": false,
					"scaleX": 1.125,
					"scaleY": 1.125,
					"scaleZ": 1.125,
					"children": [
						{
							"type": "object",
							"name": "PulseSmall",
							"scaleX": 1.08,
							"scaleY": 1.08,
							"scaleZ": 1.1,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"rotationX": 1.6721165498415313e-15,
									"rotationY": -18,
									"rotationZ": 44.6562253229215,
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
														"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.32624999999999993,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 0.8262499999999999,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 1.32625,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"enabled": false,
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 300,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -50
															},
															"nextHandle": {
																"dv": 0,
																"dt": 50
															}
														}
													]
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
															"time": 6,
															"value": 0,
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
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05v_A.png",
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
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022074571122705097,
																		"dt": -0.4999890359292585
																	},
																	"nextHandle": {
																		"dv": -0.03333333333333333,
																		"dt": 0.755
																	}
																},
																{
																	"time": 2,
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.030895415734194808,
																		"dt": -1.4585860180685686
																	},
																	"nextHandle": {
																		"dv": 0.033333333333333326,
																		"dt": 1.5763087797164927
																	}
																},
																{
																	"time": 6,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03333333333333333,
																		"dt": -0.8200000000000001
																	},
																	"nextHandle": {
																		"dv": -0.013549883609668967,
																		"dt": 0.3333271367978158
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
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
									"props": {
										"alpha": 1
									}
								}
							]
						},
						{
							"type": "object",
							"name": "PulseBig",
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleY": 0.9999999999999999,
									"rotationX": 1.6841764469393999e-15,
									"rotationY": -19.222652143119696,
									"rotationZ": 44.6562253229215,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon_2",
											"rotationX": 90,
											"rotationY": 135,
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
														"alpha": 0.9,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_2_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.2318749999999987,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 1.7318749999999987,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.169999999999998,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
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
														"texture": "Fx/Gradients/Cyl05v_A.png",
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
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 3.154247556691667e-17,
																		"dt": -0.5018355211074093
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.8267766768764707
																	}
																},
																{
																	"time": 2,
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.006534192623196213,
																		"dt": -0.7511391865776939
																	},
																	"nextHandle": {
																		"dv": -0.008333333333333304,
																		"dt": 0.9537719485582796
																	}
																},
																{
																	"time": 6,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03333333333333333,
																		"dt": -0.8200000000000001
																	},
																	"nextHandle": {
																		"dv": -0.013549883609668967,
																		"dt": 0.3333271367978158
																	}
																}
															]
														}
													]
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
															"time": 12,
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
											"scaleX": 1.11,
											"scaleY": 1.11,
											"scaleZ": 1.11,
											"rotationY": 100,
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
														"texture": "Fx/Alphas/T_UI_Circle_DottedLines_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.400624999999998,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 1.900624999999998,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.3893749999999967,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
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
															"value": 1,
															"mode": 2
														},
														{
															"time": 500,
															"value": 0,
															"mode": 2
														}
													]
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
															"time": 12,
															"value": 0,
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
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05v_A.png",
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
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 3.154247556691667e-17,
																		"dt": -0.5018355211074093
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 1.3625846460787583
																	}
																},
																{
																	"time": 2,
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.5304286359250543
																	},
																	"nextHandle": {
																		"dv": -1.9832340823177034e-16,
																		"dt": 1.577646160122186
																	}
																},
																{
																	"time": 6,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.00833333333333336,
																		"dt": -2.6890227386401953
																	},
																	"nextHandle": {
																		"dv": 0.001033799129367122,
																		"dt": 0.33436493383092153
																	}
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon_Circle",
											"scaleX": 1.22,
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
														"alpha": 0.6,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_1_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.5918749999999982,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 2.0299999999999976,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.535624999999997,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"enabled": false,
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 300,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -50
															},
															"nextHandle": {
																"dv": 0,
																"dt": 50
															}
														}
													]
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
															"time": 12,
															"value": 0,
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
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05v_A.png",
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
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022074571122705097,
																		"dt": -0.4999890359292585
																	},
																	"nextHandle": {
																		"dv": -0.03333333333333333,
																		"dt": 0.755
																	}
																},
																{
																	"time": 2,
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.030895415734194808,
																		"dt": -1.4585860180685686
																	},
																	"nextHandle": {
																		"dv": 0.033333333333333326,
																		"dt": 1.5763087797164927
																	}
																},
																{
																	"time": 6,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03333333333333333,
																		"dt": -0.8200000000000001
																	},
																	"nextHandle": {
																		"dv": -0.013549883609668967,
																		"dt": 0.3333271367978158
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
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
									"props": {
										"alpha": 1
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.75
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Test4",
					"scaleX": 1.17,
					"scaleY": 1.17,
					"scaleZ": 1.17,
					"children": [
						{
							"type": "object",
							"name": "PulseSmall",
							"enabled": false,
							"scaleX": 1.08,
							"scaleY": 1.08,
							"scaleZ": 1.1,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"rotationX": 1.6721165498415313e-15,
									"rotationY": -18,
									"rotationZ": 44.6562253229215,
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
											"enabled": false,
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
														"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.32624999999999993,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 0.8262499999999999,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 1.32625,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 300,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -50
															},
															"nextHandle": {
																"dv": 0,
																"dt": 50
															}
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
														"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.32624999999999993,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 0.8262499999999999,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 1.32625,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"enabled": false,
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 300,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -50
															},
															"nextHandle": {
																"dv": 0,
																"dt": 50
															}
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
									"enabled": false,
									"props": {
										"alpha": 1
									}
								}
							]
						},
						{
							"type": "object",
							"name": "PulseBig",
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleY": 0.9999999999999999,
									"rotationX": 1.6841764469393999e-15,
									"rotationY": -19.222652143119696,
									"rotationZ": 44.6562253229215,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon_2",
											"enabled": false,
											"rotationX": 90,
											"rotationY": 135,
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
														"alpha": 0.9,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_2_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.2318749999999987,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 1.7318749999999987,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.169999999999998,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
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
										},
										{
											"type": "polygon",
											"name": "polygon_DottedLines",
											"enabled": false,
											"scaleX": 1.11,
											"scaleY": 1.11,
											"scaleZ": 1.11,
											"rotationY": 100,
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
														"texture": "Fx/Alphas/T_UI_Circle_DottedLines_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.400624999999998,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 1.900624999999998,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.3893749999999967,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
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
											"name": "polygon_Circle",
											"enabled": false,
											"scaleX": 1.22,
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
														"alpha": 0.6,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_1_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.5918749999999982,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 2.0299999999999976,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.535624999999997,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"enabled": false,
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 300,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -50
															},
															"nextHandle": {
																"dv": 0,
																"dt": 50
															}
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon_Circle",
											"scaleX": 0.9,
											"scaleY": 0.9,
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
														"texture": "Fx/Alphas/T_UI_Line_2.png"
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
													"enabled": false,
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
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 0.88,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -16777216
																	},
																	{
																		"position": 0.38671875,
																		"color": -1
																	}
																],
																"resolution": 64
															}
														},
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
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 2.041077998578922e-16,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.5149999999999999
																	}
																},
																{
																	"time": 2.0050000000000003,
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
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "ref",
											"scaleX": 1.3,
											"scaleY": 1.3,
											"scaleZ": 1.4,
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
														"texture": "Fx/Alphas/T-InnerGradient.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8954732510288089,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.12993141289437626
																	},
																	"nextHandle": {
																		"dv": -4.2798854282701573e-16,
																		"dt": 0.36817558299039704
																	}
																},
																{
																	"time": 2,
																	"value": 0,
																	"mode": 0
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.6148426636258832,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.6558024691358049
																	},
																	"nextHandle": {
																		"dv": -3.4444415309669673e-16,
																		"dt": 0.3333451797351611
																	}
																},
																{
																	"time": 2,
																	"value": 0,
																	"mode": 0
																}
															]
														}
													]
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
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 0.8954732510288089,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.29849108367626964
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.36817558299039704
															}
														},
														{
															"time": 2,
															"value": 1,
															"mode": 0
														}
													]
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/T-InnerGradient.png",
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
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.25,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03333333333333344,
																		"dt": -0.65625
																	},
																	"nextHandle": {
																		"dv": -0.016882363217449695,
																		"dt": 0.33332115877450486
																	}
																},
																{
																	"time": 2,
																	"value": 0,
																	"mode": 0
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.97,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03333333333333344,
																		"dt": -0.65625
																	},
																	"nextHandle": {
																		"dv": -0.016882363217449695,
																		"dt": 0.33332115877450486
																	}
																},
																{
																	"time": 2,
																	"value": 0,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "scale",
													"enabled": false,
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.6811693217045547,
																"dt": -0.5213361394028144
															},
															"nextHandle": {
																"dv": 0.5316666666666666,
																"dt": 0.40735253772290925
															}
														},
														{
															"time": 2.01,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": 0.03222222222222226,
																"dt": -1.0316598079561015
															},
															"nextHandle": {
																"dv": -0.005207112186200756,
																"dt": 0.1666275899584306
															}
														},
														{
															"time": 2.0199999999999996,
															"value": 0.9827777777777778,
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
									"enabled": false,
									"props": {
										"alpha": 1
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.75
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Etat2",
					"enabled": false,
					"scaleX": 1.17,
					"scaleY": 1.17,
					"scaleZ": 1.17,
					"children": [
						{
							"type": "object",
							"name": "PulseSmall",
							"scaleX": 1.08,
							"scaleY": 1.08,
							"scaleZ": 1.1,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
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
											"rotationX": 90,
											"rotationY": 45,
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
														"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/cGrad.png",
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
																	"time": 1.952198069607767,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 5.95934147564476,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 7.986153570299354,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "width",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0.020549453364292286,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 9.925385974953173,
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
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 300,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -50
															},
															"nextHandle": {
																"dv": 0,
																"dt": 50
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
							"name": "PulseBig",
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleY": 0.9999999999999999,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon_2",
											"rotationX": 90,
											"rotationY": 90,
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
														"alpha": 0.9,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_2_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.2318749999999987,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 1.7318749999999987,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.169999999999998,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/cGrad.png",
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
																	"time": 1.952198069607767,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 5.95934147564476,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 7.986153570299354,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "width",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0.020549453364292286,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 9.925385974953173,
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
											"name": "polygon_DottedLines",
											"scaleX": 1.11,
											"scaleY": 1.11,
											"scaleZ": 1.11,
											"rotationX": 90,
											"rotationY": 135,
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
														"texture": "Fx/Alphas/T_UI_Circle_DottedLines_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.400624999999998,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 1.900624999999998,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.3893749999999967,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/cGrad.png",
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
																	"time": 1.952198069607767,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 5.95934147564476,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 7.986153570299354,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "width",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0.020549453364292286,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 9.925385974953173,
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
											"name": "polygon_Circle",
											"scaleX": 1.22,
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
														"alpha": 0.6,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_1_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.5918749999999982,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 2.0299999999999976,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.535624999999997,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/cGrad.png",
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
																	"time": 1.952198069607767,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 5.95934147564476,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 7.986153570299354,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "width",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0.020549453364292286,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 9.925385974953173,
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
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
									"props": {
										"alpha": 1
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.75
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Etat2",
					"enabled": false,
					"scaleX": 1.17,
					"scaleY": 1.17,
					"scaleZ": 1.17,
					"children": [
						{
							"type": "object",
							"name": "PulseSmall",
							"scaleX": 1.08,
							"scaleY": 1.08,
							"scaleZ": 1.1,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
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
											"rotationX": 90,
											"rotationY": 45,
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
														"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"enabled": false,
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 300,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -50
															},
															"nextHandle": {
																"dv": 0,
																"dt": 50
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
							"name": "PulseBig",
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleY": 0.9999999999999999,
									"rotationX": 1.6841764469393999e-15,
									"rotationY": -19.222652143119696,
									"rotationZ": 44.6562253229215,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon_2",
											"rotationX": -89.99999999999997,
											"rotationY": -26.323708890336036,
											"rotationZ": -90.00000000000004,
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
														"alpha": 0.9,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_2_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.2318749999999987,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 1.7318749999999987,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.169999999999998,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon_DottedLines",
											"scaleX": 1.11,
											"scaleY": 1.11,
											"scaleZ": 1.11,
											"rotationX": -7.061204112370308e-15,
											"rotationY": 89.568,
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
														"texture": "Fx/Alphas/T_UI_Circle_DottedLines_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.400624999999998,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 1.900624999999998,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.3893749999999967,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon_Circle",
											"scaleX": 1.22,
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
														"alpha": 0.6,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_1_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.5918749999999982,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 2.0299999999999976,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.535624999999997,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
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
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.3
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Tests",
					"enabled": false,
					"x": 0.004778888888888888,
					"y": 0.022278888888888883,
					"z": 0.49668999999999996,
					"children": [
						{
							"type": "object",
							"name": "test",
							"enabled": false,
							"x": -0.004778888888888888,
							"y": -0.022278888888888883,
							"z": -0.49668999999999996,
							"children": [
								{
									"type": "object",
									"name": "Test3 - 3",
									"children": [
										{
											"type": "object",
											"name": "RightCorner",
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
															"name": "polygon_DottedLines",
															"x": -2.2204460492503128e-16,
															"y": -5.201618254545842e-32,
															"scaleX": 0.6,
															"scaleY": 0.6,
															"scaleZ": 0.6,
															"rotationX": 90,
															"rotationY": 18.708748264532325,
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
																		"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.25,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.5,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.18500000000000005
																					},
																					"nextHandle": {
																						"dv": -6.69672683488781e-17,
																						"dt": 0.20506096654409864
																					}
																				},
																				{
																					"time": 0.75,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 2,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.25,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.5,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.18500000000000005
																					},
																					"nextHandle": {
																						"dv": -6.69672683488781e-17,
																						"dt": 0.20506096654409864
																					}
																				},
																				{
																					"time": 0.75,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 2,
																					"value": 0.5,
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
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.25,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.08333333333333333
																			}
																		},
																		{
																			"time": 0.5,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.14181069958847642
																			},
																			"nextHandle": {
																				"dv": -9.313060688508117e-18,
																				"dt": 0.16023052980660232
																			}
																		},
																		{
																			"time": 0.75,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.4166666666666667
																			}
																		},
																		{
																			"time": 2,
																			"value": 0.95,
																			"mode": 0
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon_2",
															"scaleX": 0.8,
															"scaleY": 0.8,
															"scaleZ": 0.8,
															"rotationX": -89.99999999999997,
															"rotationY": -26.323708890336036,
															"rotationZ": -90.00000000000004,
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
																		"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.18407407407407372,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.18407407407407372,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.4340740740740737,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 0.4340740740740737,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.837423715626769e-17,
																						"dt": -0.22505554869853764
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.22499999999999987
																					}
																				},
																				{
																					"time": 0.6840740740740737,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 0.6840740740740737,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.18407407407407372,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.18407407407407372,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.4340740740740737,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 0.4340740740740737,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.837423715626769e-17,
																						"dt": -0.22505554869853764
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.22499999999999987
																					}
																				},
																				{
																					"time": 0.6840740740740737,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 0.6840740740740737,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.5,
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
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.18407407407407372,
																			"value": 0.95,
																			"mode": 0
																		},
																		{
																			"time": 0.18407407407407372,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.08333333333333333
																			}
																		},
																		{
																			"time": 0.4340740740740737,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 0.4340740740740737,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 3.36737436272209e-18,
																				"dt": -0.11587086055649083
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.1550068587105644
																			}
																		},
																		{
																			"time": 0.6840740740740737,
																			"value": 0.95,
																			"mode": 0
																		},
																		{
																			"time": 0.6840740740740737,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3833333333333333
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.95,
																			"mode": 0
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon_DottedLines",
															"rotationX": -7.061204112370308e-15,
															"rotationY": 89.568,
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
																		"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.2090123456790119,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.2090123456790119,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.45901234567901184,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 0.45901234567901184,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.0031697890191121143,
																						"dt": -0.1949420246753946
																					},
																					"nextHandle": {
																						"dv": -0.0033333333333332993,
																						"dt": 0.20500000000000007
																					}
																				},
																				{
																					"time": 0.7090123456790118,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 0.7090123456790118,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.2090123456790119,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.2090123456790119,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.45901234567901184,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 0.45901234567901184,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.0031697890191121143,
																						"dt": -0.1949420246753946
																					},
																					"nextHandle": {
																						"dv": -0.0033333333333332993,
																						"dt": 0.20500000000000007
																					}
																				},
																				{
																					"time": 0.7090123456790118,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 0.7090123456790118,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.5,
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
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.2090123456790119,
																			"value": 0.95,
																			"mode": 0
																		},
																		{
																			"time": 0.2090123456790119,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.08333333333333331
																			}
																		},
																		{
																			"time": 0.45901234567901184,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 0.45901234567901184,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 3.709628174456492e-18,
																				"dt": -0.12764776428701236
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.14631001371742336
																			}
																		},
																		{
																			"time": 0.7090123456790118,
																			"value": 0.95,
																			"mode": 0
																		},
																		{
																			"time": 0.7090123456790118,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3499999999999999
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.95,
																			"mode": 0
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
																		"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.2432098765432089,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.2432098765432089,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.543209876543209,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 0.543209876543209,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.5920408388915597e-17,
																						"dt": -0.19500000000000006
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.20499999999999985
																					}
																				},
																				{
																					"time": 0.793209876543209,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 0.793209876543209,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.2432098765432089,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.2432098765432089,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.543209876543209,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 0.543209876543209,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.5920408388915597e-17,
																						"dt": -0.19500000000000006
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.20499999999999985
																					}
																				},
																				{
																					"time": 0.793209876543209,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 0.793209876543209,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.5,
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
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.2432098765432089,
																			"value": 0.95,
																			"mode": 0
																		},
																		{
																			"time": 0.2432098765432089,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.10000000000000002
																			}
																		},
																		{
																			"time": 0.543209876543209,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 0.543209876543209,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0008333333333332416,
																				"dt": -0.1292729766803824
																			},
																			"nextHandle": {
																				"dv": -0.0008825663923277424,
																				"dt": 0.137607717993883
																			}
																		},
																		{
																			"time": 0.793209876543209,
																			"value": 0.95,
																			"mode": 0
																		},
																		{
																			"time": 0.793209876543209,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3166666666666666
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.95,
																			"mode": 0
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
														"alpha": 0.75
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Test3 - 4",
									"children": [
										{
											"type": "object",
											"name": "RightCorner",
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
															"name": "polygon_DottedLines",
															"x": -2.2204460492503128e-16,
															"y": -5.201618254545842e-32,
															"scaleX": 0.6,
															"scaleY": 0.6,
															"scaleZ": 0.6,
															"rotationX": 90,
															"rotationY": 18.708748264532325,
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
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.25,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.5,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.18500000000000005
																					},
																					"nextHandle": {
																						"dv": -6.69672683488781e-17,
																						"dt": 0.20506096654409864
																					}
																				},
																				{
																					"time": 0.75,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 2,
																					"value": 0.5,
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
																			"time": 500,
																			"value": 1,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.25,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.08333333333333333
																			}
																		},
																		{
																			"time": 0.5,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.14181069958847642
																			},
																			"nextHandle": {
																				"dv": -9.313060688508117e-18,
																				"dt": 0.16023052980660232
																			}
																		},
																		{
																			"time": 0.75,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.4166666666666667
																			}
																		},
																		{
																			"time": 2,
																			"value": 0.95,
																			"mode": 0
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon_2",
															"scaleX": 0.8,
															"scaleY": 0.8,
															"scaleZ": 0.8,
															"rotationX": -89.99999999999997,
															"rotationY": -26.323708890336036,
															"rotationZ": -90.00000000000004,
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
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.35,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.6,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.837423715626769e-17,
																						"dt": -0.22505554869853764
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.22499999999999987
																					}
																				},
																				{
																					"time": 0.85,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.35,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.6,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.837423715626769e-17,
																						"dt": -0.22505554869853764
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.22499999999999987
																					}
																				},
																				{
																					"time": 0.85,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.5,
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
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.35,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.08333333333333333
																			}
																		},
																		{
																			"time": 0.6,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 3.36737436272209e-18,
																				"dt": -0.11587086055649083
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.1550068587105644
																			}
																		},
																		{
																			"time": 0.85,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3833333333333333
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.95,
																			"mode": 0
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon_DottedLines",
															"rotationX": -7.061204112370308e-15,
															"rotationY": 89.568,
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
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.40517940054017104,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.40517940054017104,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.655179400540171,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 0.655179400540171,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.0031697890191121143,
																						"dt": -0.1949420246753946
																					},
																					"nextHandle": {
																						"dv": -0.0033333333333332993,
																						"dt": 0.20500000000000007
																					}
																				},
																				{
																					"time": 0.905179400540171,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 0.905179400540171,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.40517940054017104,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.40517940054017104,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.655179400540171,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 0.655179400540171,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.0031697890191121143,
																						"dt": -0.1949420246753946
																					},
																					"nextHandle": {
																						"dv": -0.0033333333333332993,
																						"dt": 0.20500000000000007
																					}
																				},
																				{
																					"time": 0.905179400540171,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 0.905179400540171,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.5,
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
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.40517940054017104,
																			"value": 0.95,
																			"mode": 0
																		},
																		{
																			"time": 0.40517940054017104,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.08333333333333331
																			}
																		},
																		{
																			"time": 0.655179400540171,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 0.655179400540171,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 3.709628174456492e-18,
																				"dt": -0.12764776428701236
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.14631001371742336
																			}
																		},
																		{
																			"time": 0.905179400540171,
																			"value": 0.95,
																			"mode": 0
																		},
																		{
																			"time": 0.905179400540171,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3499999999999999
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.95,
																			"mode": 0
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
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.43569218338372395,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.43569218338372395,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.43569218338372395,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.735692183383724,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 0.735692183383724,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 0.735692183383724,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.5920408388915597e-17,
																						"dt": -0.19500000000000006
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.20499999999999985
																					}
																				},
																				{
																					"time": 0.985692183383724,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 0.985692183383724,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 0.985692183383724,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.43569218338372395,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.43569218338372395,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.43569218338372395,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.735692183383724,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 0.735692183383724,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 0.735692183383724,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.5920408388915597e-17,
																						"dt": -0.19500000000000006
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.20499999999999985
																					}
																				},
																				{
																					"time": 0.985692183383724,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 0.985692183383724,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 0.985692183383724,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.5,
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
																			0.43137254901960786,
																			0.2196078431372549,
																			0.10588235294117647
																		]
																	}
																},
																{
																	"type": "curve",
																	"name": "rotation.x",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 150,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -50
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 50
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.43569218338372395,
																			"value": 0.95,
																			"mode": 0
																		},
																		{
																			"time": 0.43569218338372395,
																			"value": 0.95,
																			"mode": 0
																		},
																		{
																			"time": 0.43569218338372395,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.10000000000000002
																			}
																		},
																		{
																			"time": 0.735692183383724,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 0.735692183383724,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 0.735692183383724,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0008333333333332416,
																				"dt": -0.1292729766803824
																			},
																			"nextHandle": {
																				"dv": -0.0008825663923277424,
																				"dt": 0.137607717993883
																			}
																		},
																		{
																			"time": 0.985692183383724,
																			"value": 0.95,
																			"mode": 0
																		},
																		{
																			"time": 0.985692183383724,
																			"value": 0.95,
																			"mode": 0
																		},
																		{
																			"time": 0.985692183383724,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3166666666666666
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.95,
																			"mode": 0
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon_Dots",
															"enabled": false,
															"scaleX": 1.4,
															"scaleY": 1.4,
															"scaleZ": 1.4,
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
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.65,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.9,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.2250000000000001
																					},
																					"nextHandle": {
																						"dv": -3.9188697572715314e-17,
																						"dt": 0.24
																					}
																				},
																				{
																					"time": 1.15,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 2,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.65,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.9,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.2250000000000001
																					},
																					"nextHandle": {
																						"dv": -3.9188697572715314e-17,
																						"dt": 0.24
																					}
																				},
																				{
																					"time": 1.15,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 2,
																					"value": 0.5,
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
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.65,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.08333333333333333
																			}
																		},
																		{
																			"time": 0.9,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0007594883770492254,
																				"dt": -0.13442006633799564
																			},
																			"nextHandle": {
																				"dv": -0.0008333333333333526,
																				"dt": 0.14647462277092183
																			}
																		},
																		{
																			"time": 1.15,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.0833333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.2833333333333334
																			}
																		},
																		{
																			"time": 2,
																			"value": 0.95,
																			"mode": 0
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "ref",
															"enabled": false,
															"scaleX": 1.825,
															"scaleY": 1.825,
															"scaleZ": 1.825,
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
																		"texture": "Fx/Alphas/T-InnerGradient.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.5541068403328583,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 0.8954732510288089,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.12993141289437626
																					},
																					"nextHandle": {
																						"dv": -4.2798854282701573e-16,
																						"dt": 0.36817558299039704
																					}
																				},
																				{
																					"time": 2,
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
																	"enabled": false,
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
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8954732510288089,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.29849108367626964
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.36817558299039704
																			}
																		},
																		{
																			"time": 2,
																			"value": 1,
																			"mode": 0
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
														"alpha": 1
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
							"name": "test",
							"enabled": false,
							"x": -0.004778888888888888,
							"y": -0.022278888888888883,
							"z": -0.49668999999999996,
							"children": [
								{
									"type": "object",
									"name": "Test3 - 3",
									"enabled": false,
									"children": [
										{
											"type": "object",
											"name": "RightCorner",
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
															"name": "polygon_DottedLines",
															"x": -2.2204460492503128e-16,
															"y": -5.201618254545842e-32,
															"scaleX": 0.6,
															"scaleY": 0.6,
															"scaleZ": 0.6,
															"rotationX": 90,
															"rotationY": 18.708748264532325,
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
																		"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.25,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.5,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.18500000000000005
																					},
																					"nextHandle": {
																						"dv": -6.69672683488781e-17,
																						"dt": 0.20506096654409864
																					}
																				},
																				{
																					"time": 0.75,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 2,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.25,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.5,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.18500000000000005
																					},
																					"nextHandle": {
																						"dv": -6.69672683488781e-17,
																						"dt": 0.20506096654409864
																					}
																				},
																				{
																					"time": 0.75,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 2,
																					"value": 0.5,
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
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.25,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.08333333333333333
																			}
																		},
																		{
																			"time": 0.5,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.14181069958847642
																			},
																			"nextHandle": {
																				"dv": -9.313060688508117e-18,
																				"dt": 0.16023052980660232
																			}
																		},
																		{
																			"time": 0.75,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.4166666666666667
																			}
																		},
																		{
																			"time": 2,
																			"value": 0.95,
																			"mode": 0
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon_2",
															"scaleX": 0.8,
															"scaleY": 0.8,
															"scaleZ": 0.8,
															"rotationX": -89.99999999999997,
															"rotationY": -26.323708890336036,
															"rotationZ": -90.00000000000004,
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
																		"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.18407407407407372,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.4340740740740737,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.837423715626769e-17,
																						"dt": -0.22505554869853764
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.22499999999999987
																					}
																				},
																				{
																					"time": 0.6840740740740737,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.18407407407407372,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.4340740740740737,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.837423715626769e-17,
																						"dt": -0.22505554869853764
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.22499999999999987
																					}
																				},
																				{
																					"time": 0.6840740740740737,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.5,
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
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.18407407407407372,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.08333333333333333
																			}
																		},
																		{
																			"time": 0.4340740740740737,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 3.36737436272209e-18,
																				"dt": -0.11587086055649083
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.1550068587105644
																			}
																		},
																		{
																			"time": 0.6840740740740737,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3833333333333333
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.95,
																			"mode": 0
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon_DottedLines",
															"rotationX": -7.061204112370308e-15,
															"rotationY": 89.568,
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
																		"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.2090123456790119,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.45901234567901184,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.0031697890191121143,
																						"dt": -0.1949420246753946
																					},
																					"nextHandle": {
																						"dv": -0.0033333333333332993,
																						"dt": 0.20500000000000007
																					}
																				},
																				{
																					"time": 0.7090123456790118,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.2090123456790119,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.45901234567901184,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.0031697890191121143,
																						"dt": -0.1949420246753946
																					},
																					"nextHandle": {
																						"dv": -0.0033333333333332993,
																						"dt": 0.20500000000000007
																					}
																				},
																				{
																					"time": 0.7090123456790118,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.5,
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
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.2090123456790119,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.08333333333333331
																			}
																		},
																		{
																			"time": 0.45901234567901184,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 3.709628174456492e-18,
																				"dt": -0.12764776428701236
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.14631001371742336
																			}
																		},
																		{
																			"time": 0.7090123456790118,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3499999999999999
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.95,
																			"mode": 0
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
																		"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.2432098765432089,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.543209876543209,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.5920408388915597e-17,
																						"dt": -0.19500000000000006
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.20499999999999985
																					}
																				},
																				{
																					"time": 0.793209876543209,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.2432098765432089,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.543209876543209,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.5920408388915597e-17,
																						"dt": -0.19500000000000006
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.20499999999999985
																					}
																				},
																				{
																					"time": 0.793209876543209,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.5,
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
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.2432098765432089,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.10000000000000002
																			}
																		},
																		{
																			"time": 0.543209876543209,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0008333333333332416,
																				"dt": -0.1292729766803824
																			},
																			"nextHandle": {
																				"dv": -0.0008825663923277424,
																				"dt": 0.137607717993883
																			}
																		},
																		{
																			"time": 0.793209876543209,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3166666666666666
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.95,
																			"mode": 0
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
														"alpha": 0.6
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Test3 - 4",
									"children": [
										{
											"type": "object",
											"name": "RightCorner",
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
															"name": "polygon_DottedLines",
															"x": -2.2204460492503128e-16,
															"y": -5.201618254545842e-32,
															"scaleX": 0.6,
															"scaleY": 0.6,
															"scaleZ": 0.6,
															"rotationX": 90,
															"rotationY": 18.708748264532325,
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
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.25,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.5,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.18500000000000005
																					},
																					"nextHandle": {
																						"dv": -6.69672683488781e-17,
																						"dt": 0.20506096654409864
																					}
																				},
																				{
																					"time": 0.75,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 2,
																					"value": 0.5,
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
																			"time": 500,
																			"value": 1,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.25,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.08333333333333333
																			}
																		},
																		{
																			"time": 0.5,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.14181069958847642
																			},
																			"nextHandle": {
																				"dv": -9.313060688508117e-18,
																				"dt": 0.16023052980660232
																			}
																		},
																		{
																			"time": 0.75,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.4166666666666667
																			}
																		},
																		{
																			"time": 2,
																			"value": 0.95,
																			"mode": 0
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
															"rotationX": -89.99999999999997,
															"rotationY": -26.323708890336036,
															"rotationZ": -90.00000000000004,
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
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.35,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.6,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.837423715626769e-17,
																						"dt": -0.22505554869853764
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.22499999999999987
																					}
																				},
																				{
																					"time": 0.85,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.35,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.6,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.837423715626769e-17,
																						"dt": -0.22505554869853764
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.22499999999999987
																					}
																				},
																				{
																					"time": 0.85,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.5,
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
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.35,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.08333333333333333
																			}
																		},
																		{
																			"time": 0.55,
																			"value": 1.025,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 3.36737436272209e-18,
																				"dt": -0.11587086055649083
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.1550068587105644
																			}
																		},
																		{
																			"time": 0.75,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3833333333333333
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.95,
																			"mode": 0
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon_DottedLines",
															"scaleX": 0.8,
															"scaleY": 0.8,
															"scaleZ": 0.8,
															"rotationX": -7.061204112370308e-15,
															"rotationY": 89.568,
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
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.40517940054017104,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.655179400540171,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.0031697890191121143,
																						"dt": -0.1949420246753946
																					},
																					"nextHandle": {
																						"dv": -0.0033333333333332993,
																						"dt": 0.20500000000000007
																					}
																				},
																				{
																					"time": 0.905179400540171,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.40517940054017104,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.655179400540171,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.0031697890191121143,
																						"dt": -0.1949420246753946
																					},
																					"nextHandle": {
																						"dv": -0.0033333333333332993,
																						"dt": 0.20500000000000007
																					}
																				},
																				{
																					"time": 0.905179400540171,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.5,
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
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.45,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.08333333333333331
																			}
																		},
																		{
																			"time": 0.7,
																			"value": 1.05,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 3.709628174456492e-18,
																				"dt": -0.12764776428701236
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.14631001371742336
																			}
																		},
																		{
																			"time": 0.95,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3499999999999999
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.95,
																			"mode": 0
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon_Circle",
															"scaleX": 0.9,
															"scaleY": 0.9,
															"scaleZ": 0.9,
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
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.43569218338372395,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.735692183383724,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.5920408388915597e-17,
																						"dt": -0.19500000000000006
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.20499999999999985
																					}
																				},
																				{
																					"time": 0.985692183383724,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.43569218338372395,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.735692183383724,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.5920408388915597e-17,
																						"dt": -0.19500000000000006
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.20499999999999985
																					}
																				},
																				{
																					"time": 0.985692183383724,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.5,
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
																			0.43137254901960786,
																			0.2196078431372549,
																			0.10588235294117647
																		]
																	}
																},
																{
																	"type": "curve",
																	"name": "rotation.x",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 150,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -50
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 50
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.55,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.10000000000000002
																			}
																		},
																		{
																			"time": 0.735692183383724,
																			"value": 1.075,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0008333333333332416,
																				"dt": -0.1292729766803824
																			},
																			"nextHandle": {
																				"dv": -0.0008825663923277424,
																				"dt": 0.137607717993883
																			}
																		},
																		{
																			"time": 0.985692183383724,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3166666666666666
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.95,
																			"mode": 0
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon_Circle",
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
																		"alpha": 0.85,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_UI_Circle_DottedLines.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.5058461651469344,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.8058461651469344,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.5920408388915597e-17,
																						"dt": -0.19500000000000006
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.20499999999999985
																					}
																				},
																				{
																					"time": 1.0558461651469344,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.5058461651469344,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.8058461651469344,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.5920408388915597e-17,
																						"dt": -0.19500000000000006
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.20499999999999985
																					}
																				},
																				{
																					"time": 1.0558461651469344,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.5,
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
																			0.43137254901960786,
																			0.2196078431372549,
																			0.10588235294117647
																		]
																	}
																},
																{
																	"type": "curve",
																	"name": "rotation.x",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 150,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -50
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 50
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.5506667646067633,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.10000000000000002
																			}
																		},
																		{
																			"time": 0.7863589479904873,
																			"value": 1.1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0008333333333332416,
																				"dt": -0.1292729766803824
																			},
																			"nextHandle": {
																				"dv": -0.0008825663923277424,
																				"dt": 0.137607717993883
																			}
																		},
																		{
																			"time": 1.0363589479904873,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3166666666666666
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.95,
																			"mode": 0
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon_Circle",
															"scaleX": 1.1,
															"scaleY": 1.1,
															"scaleZ": 1.1,
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
																		"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.5253333823033817,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.8253333823033817,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.5920408388915597e-17,
																						"dt": -0.19500000000000006
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.20499999999999985
																					}
																				},
																				{
																					"time": 1.0753333823033817,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.5253333823033817,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.8253333823033817,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.5920408388915597e-17,
																						"dt": -0.19500000000000006
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.20499999999999985
																					}
																				},
																				{
																					"time": 1.0753333823033817,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.5,
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
																			0.43137254901960786,
																			0.2196078431372549,
																			0.10588235294117647
																		]
																	}
																},
																{
																	"type": "curve",
																	"name": "rotation.x",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 150,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -50
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 50
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.5740514251945001,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.10000000000000002
																			}
																		},
																		{
																			"time": 0.8097436085782241,
																			"value": 1.125,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0008333333333332416,
																				"dt": -0.1292729766803824
																			},
																			"nextHandle": {
																				"dv": -0.0008825663923277424,
																				"dt": 0.137607717993883
																			}
																		},
																		{
																			"time": 1.0597436085782241,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3166666666666666
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.95,
																			"mode": 0
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
																		"alpha": 0.95,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_UI_Circle_1.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.5487180428911185,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.8487180428911185,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.5920408388915597e-17,
																						"dt": -0.19500000000000006
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.20499999999999985
																					}
																				},
																				{
																					"time": 1.0987180428911185,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.5487180428911185,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.8487180428911185,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.5920408388915597e-17,
																						"dt": -0.19500000000000006
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.20499999999999985
																					}
																				},
																				{
																					"time": 1.0987180428911185,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.5,
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
																			0.43137254901960786,
																			0.2196078431372549,
																			0.10588235294117647
																		]
																	}
																},
																{
																	"type": "curve",
																	"name": "rotation.x",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 150,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -50
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 50
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.6013335292135265,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.10000000000000002
																			}
																		},
																		{
																			"time": 0.8370257125972504,
																			"value": 1.15,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0008333333333332416,
																				"dt": -0.1292729766803824
																			},
																			"nextHandle": {
																				"dv": -0.0008825663923277424,
																				"dt": 0.137607717993883
																			}
																		},
																		{
																			"time": 1.0870257125972504,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3166666666666666
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.95,
																			"mode": 0
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon_Circle",
															"enabled": false,
															"scaleX": 1.3,
															"scaleY": 1.3,
															"scaleZ": 1.3,
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
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"enabled": false,
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.5487180428911185,
																					"value": 0.25,
																					"mode": 2
																				},
																				{
																					"time": 0.8487180428911185,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.5920408388915597e-17,
																						"dt": -0.19500000000000006
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.20499999999999985
																					}
																				},
																				{
																					"time": 1.0987180428911185,
																					"value": 0.25,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.25,
																					"mode": 0
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0.5487180428911185,
																					"value": 0.5,
																					"mode": 2
																				},
																				{
																					"time": 0.8487180428911185,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.5920408388915597e-17,
																						"dt": -0.19500000000000006
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.20499999999999985
																					}
																				},
																				{
																					"time": 1.0987180428911185,
																					"value": 0.5,
																					"mode": 0
																				},
																				{
																					"time": 1.9999999999999998,
																					"value": 0.5,
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
																			0.43137254901960786,
																			0.2196078431372549,
																			0.10588235294117647
																		]
																	}
																},
																{
																	"type": "curve",
																	"name": "rotation.x",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 150,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -50
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 50
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.6617439023985132,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.10000000000000002
																			}
																		},
																		{
																			"time": 0.8974360857822372,
																			"value": 1.15,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0008333333333332416,
																				"dt": -0.1292729766803824
																			},
																			"nextHandle": {
																				"dv": -0.0008825663923277424,
																				"dt": 0.137607717993883
																			}
																		},
																		{
																			"time": 1.149384807497882,
																			"value": 0.95,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3166666666666666
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.95,
																			"mode": 0
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "ref",
															"enabled": false,
															"scaleX": 1.825,
															"scaleY": 1.825,
															"scaleZ": 1.825,
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
																		"texture": "Fx/Alphas/T-InnerGradient.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"loop": true,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.5541068403328583,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 0.8954732510288089,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.12993141289437626
																					},
																					"nextHandle": {
																						"dv": -4.2798854282701573e-16,
																						"dt": 0.36817558299039704
																					}
																				},
																				{
																					"time": 2,
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
																	"enabled": false,
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
																},
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8954732510288089,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.29849108367626964
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.36817558299039704
																			}
																		},
																		{
																			"time": 2,
																			"value": 1,
																			"mode": 0
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
														"alpha": 1.1
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
							"name": "Test6",
							"x": -0.004778888888888888,
							"y": -0.022278888888888883,
							"z": -0.49668999999999996,
							"children": [
								{
									"type": "object",
									"name": "RightCorner",
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
													"name": "polygon_DottedLines",
													"x": -2.2204460492503128e-16,
													"y": -5.201618254545842e-32,
													"scaleX": 0.6,
													"scaleY": 0.6,
													"scaleZ": 0.6,
													"rotationX": 90,
													"rotationY": 18.708748264532325,
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
																"texture": "Fx/Alphas/T_UI_Circle_DottedLines.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.36676400578803775,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 0.37676400578803776,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.19672038852854842,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 0.37676400578803776,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 2,
																	"value": 1,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_2",
													"scaleX": 0.8,
													"scaleY": 0.8,
													"scaleZ": 0.8,
													"rotationX": -89.99999999999997,
													"rotationY": -26.323708890336036,
													"rotationZ": -90.00000000000004,
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
																"texture": "Fx/Alphas/T_UI_Circle_1.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.35,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.6,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.837423715626769e-17,
																				"dt": -0.22505554869853764
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.22499999999999987
																			}
																		},
																		{
																			"time": 0.85,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.35,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.6,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.837423715626769e-17,
																				"dt": -0.22505554869853764
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.22499999999999987
																			}
																		},
																		{
																			"time": 0.85,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.5005346407221135,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 0.5105346407221135,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.35,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333333
																	}
																},
																{
																	"time": 0.6,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 3.36737436272209e-18,
																		"dt": -0.11587086055649083
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.1550068587105644
																	}
																},
																{
																	"time": 0.85,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3833333333333333
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
																}
															]
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.2855090216976117,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 0.5105346407221135,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 2,
																	"value": 1,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_DottedLines",
													"rotationX": -7.061204112370308e-15,
													"rotationY": 89.568,
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
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_UI_Circle_DottedLines.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.45,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.7,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0031697890191121143,
																				"dt": -0.1949420246753946
																			},
																			"nextHandle": {
																				"dv": -0.0033333333333332993,
																				"dt": 0.20500000000000007
																			}
																		},
																		{
																			"time": 0.95,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.45,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.7,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0031697890191121143,
																				"dt": -0.1949420246753946
																			},
																			"nextHandle": {
																				"dv": -0.0033333333333332993,
																				"dt": 0.20500000000000007
																			}
																		},
																		{
																			"time": 0.95,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.7151071708806831,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 0.7251071708806831,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.45,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 0.7,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 3.709628174456492e-18,
																		"dt": -0.12764776428701236
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.14631001371742336
																	}
																},
																{
																	"time": 0.95,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
																}
															]
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.31569291793444704,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 0.7251071708806831,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 2,
																	"value": 1,
																	"mode": 0
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
																"alpha": 0.4,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_UI_Circle_1.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.5,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.8,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.5920408388915597e-17,
																				"dt": -0.19500000000000006
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.20499999999999985
																			}
																		},
																		{
																			"time": 1.05,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.5,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.8,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.5920408388915597e-17,
																				"dt": -0.19500000000000006
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.20499999999999985
																			}
																		},
																		{
																			"time": 1.05,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.9601071708806836,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 0.9701071708806837,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.5,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.10000000000000002
																	}
																},
																{
																	"time": 0.8,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0008333333333332416,
																		"dt": -0.1292729766803824
																	},
																	"nextHandle": {
																		"dv": -0.0008825663923277424,
																		"dt": 0.137607717993883
																	}
																},
																{
																	"time": 1.05,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3166666666666666
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
																}
															]
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.2706929179344466,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 0.9701071708806837,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 2,
																	"value": 1,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_Dots",
													"enabled": false,
													"scaleX": 1.4,
													"scaleY": 1.4,
													"scaleZ": 1.4,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.65,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.9,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.2250000000000001
																			},
																			"nextHandle": {
																				"dv": -3.9188697572715314e-17,
																				"dt": 0.24
																			}
																		},
																		{
																			"time": 1.15,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.65,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.9,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.2250000000000001
																			},
																			"nextHandle": {
																				"dv": -3.9188697572715314e-17,
																				"dt": 0.24
																			}
																		},
																		{
																			"time": 1.15,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.5,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.35569291793444746,
																			"value": 0.6,
																			"mode": 0
																		},
																		{
																			"time": 1.2501071708806848,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.95,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.65,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333333
																	}
																},
																{
																	"time": 0.9,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0007594883770492254,
																		"dt": -0.13442006633799564
																	},
																	"nextHandle": {
																		"dv": -0.0008333333333333526,
																		"dt": 0.14647462277092183
																	}
																},
																{
																	"time": 1.15,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.0833333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.2833333333333334
																	}
																},
																{
																	"time": 2,
																	"value": 0.95,
																	"mode": 0
																}
															]
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.35569291793444746,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 1.2501071708806848,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 2,
																	"value": 0.95,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "ref",
													"scaleX": 1.825,
													"scaleY": 1.825,
													"scaleZ": 1.825,
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
																"texture": "Fx/Alphas/T-InnerGradient.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.8954732510288089,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.12993141289437626
																			},
																			"nextHandle": {
																				"dv": -4.2798854282701573e-16,
																				"dt": 0.36817558299039704
																			}
																		},
																		{
																			"time": 2,
																			"value": 0,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.6148426636258832,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6558024691358049
																			},
																			"nextHandle": {
																				"dv": -3.4444415309669673e-16,
																				"dt": 0.3333451797351611
																			}
																		},
																		{
																			"time": 2,
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
															"enabled": false,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8954732510288089,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.29849108367626964
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.36817558299039704
																	}
																},
																{
																	"time": 2,
																	"value": 1,
																	"mode": 0
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.5,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Alphas/T-InnerGradient.png",
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
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.25,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.03333333333333344,
																				"dt": -0.65625
																			},
																			"nextHandle": {
																				"dv": -0.016882363217449695,
																				"dt": 0.33332115877450486
																			}
																		},
																		{
																			"time": 2,
																			"value": 0,
																			"mode": 0
																		}
																	]
																}
															]
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.6811693217045547,
																		"dt": -0.5213361394028144
																	},
																	"nextHandle": {
																		"dv": 0.5316666666666666,
																		"dt": 0.40735253772290925
																	}
																},
																{
																	"time": 2,
																	"value": 0.9666666666666667,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03222222222222226,
																		"dt": -1.0316598079561015
																	},
																	"nextHandle": {
																		"dv": -0.005207112186200756,
																		"dt": 0.1666275899584306
																	}
																},
																{
																	"time": 2,
																	"value": 0.9827777777777778,
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
												"alpha": 1
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Test6",
							"enabled": false,
							"x": -0.004778888888888888,
							"y": -0.022278888888888883,
							"z": -0.49668999999999996,
							"children": [
								{
									"type": "object",
									"name": "RightCorner",
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
													"name": "polygon_DottedLines",
													"x": -2.2204460492503128e-16,
													"y": -5.201618254545842e-32,
													"scaleX": 0.6,
													"scaleY": 0.6,
													"scaleZ": 0.6,
													"rotationX": 90,
													"rotationY": 18.708748264532325,
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
																"texture": "Fx/Alphas/T_UI_Circle_DottedLines.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.36676400578803775,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 0.37676400578803776,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.19672038852854842,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 0.37676400578803776,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 2,
																	"value": 1,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_2",
													"scaleX": 0.8,
													"scaleY": 0.8,
													"scaleZ": 0.8,
													"rotationX": -89.99999999999997,
													"rotationY": -26.323708890336036,
													"rotationZ": -90.00000000000004,
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
																"texture": "Fx/Alphas/T_UI_Circle_1.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.35,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.6,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.837423715626769e-17,
																				"dt": -0.22505554869853764
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.22499999999999987
																			}
																		},
																		{
																			"time": 0.85,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.35,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.6,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.837423715626769e-17,
																				"dt": -0.22505554869853764
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.22499999999999987
																			}
																		},
																		{
																			"time": 0.85,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.5005346407221135,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 0.5105346407221135,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.35,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333333
																	}
																},
																{
																	"time": 0.6,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 3.36737436272209e-18,
																		"dt": -0.11587086055649083
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.1550068587105644
																	}
																},
																{
																	"time": 0.85,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3833333333333333
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
																}
															]
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.2855090216976117,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 0.2855090216976117,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 0.5105346407221135,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 0.5105346407221135,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 2,
																	"value": 1,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_DottedLines",
													"rotationX": -7.061204112370308e-15,
													"rotationY": 89.568,
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
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_UI_Circle_DottedLines.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.45,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.7,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0031697890191121143,
																				"dt": -0.1949420246753946
																			},
																			"nextHandle": {
																				"dv": -0.0033333333333332993,
																				"dt": 0.20500000000000007
																			}
																		},
																		{
																			"time": 0.95,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.45,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.7,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0031697890191121143,
																				"dt": -0.1949420246753946
																			},
																			"nextHandle": {
																				"dv": -0.0033333333333332993,
																				"dt": 0.20500000000000007
																			}
																		},
																		{
																			"time": 0.95,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.7151071708806831,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 0.7251071708806831,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.45,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 0.7,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 3.709628174456492e-18,
																		"dt": -0.12764776428701236
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.14631001371742336
																	}
																},
																{
																	"time": 0.95,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
																}
															]
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.31569291793444704,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 0.31569291793444704,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 0.7251071708806831,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 0.7251071708806831,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 2,
																	"value": 1,
																	"mode": 0
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
																"alpha": 0.4,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_UI_Circle_1.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.5,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.8,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.5920408388915597e-17,
																				"dt": -0.19500000000000006
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.20499999999999985
																			}
																		},
																		{
																			"time": 1.05,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.5,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.8,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.5920408388915597e-17,
																				"dt": -0.19500000000000006
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.20499999999999985
																			}
																		},
																		{
																			"time": 1.05,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.9601071708806836,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 0.9701071708806837,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.5,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.10000000000000002
																	}
																},
																{
																	"time": 0.8,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0008333333333332416,
																		"dt": -0.1292729766803824
																	},
																	"nextHandle": {
																		"dv": -0.0008825663923277424,
																		"dt": 0.137607717993883
																	}
																},
																{
																	"time": 1.05,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3166666666666666
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
																}
															]
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.2706929179344466,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 0.2706929179344466,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 0.2706929179344466,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 0.9701071708806837,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 0.9701071708806837,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 2,
																	"value": 1,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_Dots",
													"enabled": false,
													"scaleX": 1.4,
													"scaleY": 1.4,
													"scaleZ": 1.4,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.65,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.9,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.2250000000000001
																			},
																			"nextHandle": {
																				"dv": -3.9188697572715314e-17,
																				"dt": 0.24
																			}
																		},
																		{
																			"time": 1.15,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.65,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.9,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.2250000000000001
																			},
																			"nextHandle": {
																				"dv": -3.9188697572715314e-17,
																				"dt": 0.24
																			}
																		},
																		{
																			"time": 1.15,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.5,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.35569291793444746,
																			"value": 0.6,
																			"mode": 0
																		},
																		{
																			"time": 1.2501071708806848,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.95,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.65,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333333
																	}
																},
																{
																	"time": 0.9,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0007594883770492254,
																		"dt": -0.13442006633799564
																	},
																	"nextHandle": {
																		"dv": -0.0008333333333333526,
																		"dt": 0.14647462277092183
																	}
																},
																{
																	"time": 1.15,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.0833333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.2833333333333334
																	}
																},
																{
																	"time": 2,
																	"value": 0.95,
																	"mode": 0
																}
															]
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.35569291793444746,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 0.35569291793444746,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 0.35569291793444746,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 1.2501071708806848,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1.2501071708806848,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 2,
																	"value": 0.95,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "ref",
													"scaleX": 1.825,
													"scaleY": 1.825,
													"scaleZ": 1.825,
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
																"texture": "Fx/Alphas/T-InnerGradient.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.8954732510288089,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.12993141289437626
																			},
																			"nextHandle": {
																				"dv": -4.2798854282701573e-16,
																				"dt": 0.36817558299039704
																			}
																		},
																		{
																			"time": 2,
																			"value": 0,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.6148426636258832,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6558024691358049
																			},
																			"nextHandle": {
																				"dv": -3.4444415309669673e-16,
																				"dt": 0.3333451797351611
																			}
																		},
																		{
																			"time": 2,
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
															"enabled": false,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8954732510288089,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.29849108367626964
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.36817558299039704
																	}
																},
																{
																	"time": 2,
																	"value": 1,
																	"mode": 0
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.5,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Alphas/T-InnerGradient.png",
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
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.25,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.03333333333333344,
																				"dt": -0.65625
																			},
																			"nextHandle": {
																				"dv": -0.016882363217449695,
																				"dt": 0.33332115877450486
																			}
																		},
																		{
																			"time": 2,
																			"value": 0,
																			"mode": 0
																		}
																	]
																}
															]
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.6811693217045547,
																		"dt": -0.5213361394028144
																	},
																	"nextHandle": {
																		"dv": 0.5316666666666666,
																		"dt": 0.40735253772290925
																	}
																},
																{
																	"time": 2,
																	"value": 0.9666666666666667,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03222222222222226,
																		"dt": -1.0316598079561015
																	},
																	"nextHandle": {
																		"dv": -0.005207112186200756,
																		"dt": 0.1666275899584306
																	}
																},
																{
																	"time": 2,
																	"value": 0.9827777777777778,
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
								}
							]
						},
						{
							"type": "object",
							"name": "Test3 - 2",
							"enabled": false,
							"x": -0.004778888888888888,
							"y": -0.022278888888888883,
							"z": -0.49668999999999996,
							"children": [
								{
									"type": "object",
									"name": "RightCorner",
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
													"name": "polygon_DottedLines",
													"x": -2.2204460492503128e-16,
													"y": -5.201618254545842e-32,
													"scaleX": 0.6,
													"scaleY": 0.6,
													"scaleZ": 0.6,
													"rotationX": 90,
													"rotationY": 18.708748264532325,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.25,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.5,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.18500000000000005
																			},
																			"nextHandle": {
																				"dv": -6.69672683488781e-17,
																				"dt": 0.20506096654409864
																			}
																		},
																		{
																			"time": 0.75,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.25,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.5,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.18500000000000005
																			},
																			"nextHandle": {
																				"dv": -6.69672683488781e-17,
																				"dt": 0.20506096654409864
																			}
																		},
																		{
																			"time": 0.75,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.5,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.25,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333333
																	}
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.14181069958847642
																	},
																	"nextHandle": {
																		"dv": -9.313060688508117e-18,
																		"dt": 0.16023052980660232
																	}
																},
																{
																	"time": 0.75,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.4166666666666667
																	}
																},
																{
																	"time": 2,
																	"value": 0.95,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_2",
													"scaleX": 0.8,
													"scaleY": 0.8,
													"scaleZ": 0.8,
													"rotationX": -89.99999999999997,
													"rotationY": -26.323708890336036,
													"rotationZ": -90.00000000000004,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.35,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.6,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.837423715626769e-17,
																				"dt": -0.22505554869853764
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.22499999999999987
																			}
																		},
																		{
																			"time": 0.85,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.35,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.6,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.837423715626769e-17,
																				"dt": -0.22505554869853764
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.22499999999999987
																			}
																		},
																		{
																			"time": 0.85,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.35,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333333
																	}
																},
																{
																	"time": 0.6,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 3.36737436272209e-18,
																		"dt": -0.11587086055649083
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.1550068587105644
																	}
																},
																{
																	"time": 0.85,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3833333333333333
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_DottedLines",
													"rotationX": -7.061204112370308e-15,
													"rotationY": 89.568,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.45,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.7,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0031697890191121143,
																				"dt": -0.1949420246753946
																			},
																			"nextHandle": {
																				"dv": -0.0033333333333332993,
																				"dt": 0.20500000000000007
																			}
																		},
																		{
																			"time": 0.95,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.45,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.7,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0031697890191121143,
																				"dt": -0.1949420246753946
																			},
																			"nextHandle": {
																				"dv": -0.0033333333333332993,
																				"dt": 0.20500000000000007
																			}
																		},
																		{
																			"time": 0.95,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.45,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 0.7,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 3.709628174456492e-18,
																		"dt": -0.12764776428701236
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.14631001371742336
																	}
																},
																{
																	"time": 0.95,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.5,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.8,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.5920408388915597e-17,
																				"dt": -0.19500000000000006
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.20499999999999985
																			}
																		},
																		{
																			"time": 1.05,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.5,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.8,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.5920408388915597e-17,
																				"dt": -0.19500000000000006
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.20499999999999985
																			}
																		},
																		{
																			"time": 1.05,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.5,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.10000000000000002
																	}
																},
																{
																	"time": 0.8,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0008333333333332416,
																		"dt": -0.1292729766803824
																	},
																	"nextHandle": {
																		"dv": -0.0008825663923277424,
																		"dt": 0.137607717993883
																	}
																},
																{
																	"time": 1.05,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3166666666666666
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_Dots",
													"enabled": false,
													"scaleX": 1.4,
													"scaleY": 1.4,
													"scaleZ": 1.4,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.65,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.9,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.2250000000000001
																			},
																			"nextHandle": {
																				"dv": -3.9188697572715314e-17,
																				"dt": 0.24
																			}
																		},
																		{
																			"time": 1.15,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.65,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.9,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.2250000000000001
																			},
																			"nextHandle": {
																				"dv": -3.9188697572715314e-17,
																				"dt": 0.24
																			}
																		},
																		{
																			"time": 1.15,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.5,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.65,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333333
																	}
																},
																{
																	"time": 0.9,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0007594883770492254,
																		"dt": -0.13442006633799564
																	},
																	"nextHandle": {
																		"dv": -0.0008333333333333526,
																		"dt": 0.14647462277092183
																	}
																},
																{
																	"time": 1.15,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.0833333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.2833333333333334
																	}
																},
																{
																	"time": 2,
																	"value": 0.95,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "ref",
													"scaleX": 1.825,
													"scaleY": 1.825,
													"scaleZ": 1.825,
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
																"texture": "Fx/Alphas/T-InnerGradient.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.8954732510288089,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.12993141289437626
																			},
																			"nextHandle": {
																				"dv": -4.2798854282701573e-16,
																				"dt": 0.36817558299039704
																			}
																		},
																		{
																			"time": 2,
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
															"enabled": false,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8954732510288089,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.29849108367626964
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.36817558299039704
																	}
																},
																{
																	"time": 2,
																	"value": 1,
																	"mode": 0
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
											"enabled": false,
											"props": {
												"alpha": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Test3 - 2",
							"enabled": false,
							"x": -0.004778888888888888,
							"y": -0.022278888888888883,
							"z": -0.49668999999999996,
							"children": [
								{
									"type": "object",
									"name": "RightCorner",
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
													"name": "polygon_DottedLines",
													"x": -2.2204460492503128e-16,
													"y": -5.201618254545842e-32,
													"scaleX": 0.6,
													"scaleY": 0.6,
													"scaleZ": 0.6,
													"rotationX": 90,
													"rotationY": 18.708748264532325,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.25,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.5,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.18500000000000005
																			},
																			"nextHandle": {
																				"dv": -6.69672683488781e-17,
																				"dt": 0.20506096654409864
																			}
																		},
																		{
																			"time": 0.75,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.25,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.5,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.18500000000000005
																			},
																			"nextHandle": {
																				"dv": -6.69672683488781e-17,
																				"dt": 0.20506096654409864
																			}
																		},
																		{
																			"time": 0.75,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.5,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.25,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333333
																	}
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.14181069958847642
																	},
																	"nextHandle": {
																		"dv": -9.313060688508117e-18,
																		"dt": 0.16023052980660232
																	}
																},
																{
																	"time": 0.75,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.4166666666666667
																	}
																},
																{
																	"time": 2,
																	"value": 0.95,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_2",
													"scaleX": 0.8,
													"scaleY": 0.8,
													"scaleZ": 0.8,
													"rotationX": -89.99999999999997,
													"rotationY": -26.323708890336036,
													"rotationZ": -90.00000000000004,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.35,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.6,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.837423715626769e-17,
																				"dt": -0.22505554869853764
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.22499999999999987
																			}
																		},
																		{
																			"time": 0.85,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.35,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.6,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.837423715626769e-17,
																				"dt": -0.22505554869853764
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.22499999999999987
																			}
																		},
																		{
																			"time": 0.85,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.35,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333333
																	}
																},
																{
																	"time": 0.6,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 3.36737436272209e-18,
																		"dt": -0.11587086055649083
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.1550068587105644
																	}
																},
																{
																	"time": 0.85,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3833333333333333
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_DottedLines",
													"rotationX": -7.061204112370308e-15,
													"rotationY": 89.568,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.45,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.7,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0031697890191121143,
																				"dt": -0.1949420246753946
																			},
																			"nextHandle": {
																				"dv": -0.0033333333333332993,
																				"dt": 0.20500000000000007
																			}
																		},
																		{
																			"time": 0.95,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.45,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.7,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0031697890191121143,
																				"dt": -0.1949420246753946
																			},
																			"nextHandle": {
																				"dv": -0.0033333333333332993,
																				"dt": 0.20500000000000007
																			}
																		},
																		{
																			"time": 0.95,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.45,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 0.7,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 3.709628174456492e-18,
																		"dt": -0.12764776428701236
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.14631001371742336
																	}
																},
																{
																	"time": 0.95,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.5,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.8,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.5920408388915597e-17,
																				"dt": -0.19500000000000006
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.20499999999999985
																			}
																		},
																		{
																			"time": 1.05,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.5,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.8,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.5920408388915597e-17,
																				"dt": -0.19500000000000006
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.20499999999999985
																			}
																		},
																		{
																			"time": 1.05,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.5,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.10000000000000002
																	}
																},
																{
																	"time": 0.8,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0008333333333332416,
																		"dt": -0.1292729766803824
																	},
																	"nextHandle": {
																		"dv": -0.0008825663923277424,
																		"dt": 0.137607717993883
																	}
																},
																{
																	"time": 1.05,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3166666666666666
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_Dots",
													"enabled": false,
													"scaleX": 1.4,
													"scaleY": 1.4,
													"scaleZ": 1.4,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.65,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.9,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.2250000000000001
																			},
																			"nextHandle": {
																				"dv": -3.9188697572715314e-17,
																				"dt": 0.24
																			}
																		},
																		{
																			"time": 1.15,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.65,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.9,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.2250000000000001
																			},
																			"nextHandle": {
																				"dv": -3.9188697572715314e-17,
																				"dt": 0.24
																			}
																		},
																		{
																			"time": 1.15,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.5,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.65,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333333
																	}
																},
																{
																	"time": 0.9,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0007594883770492254,
																		"dt": -0.13442006633799564
																	},
																	"nextHandle": {
																		"dv": -0.0008333333333333526,
																		"dt": 0.14647462277092183
																	}
																},
																{
																	"time": 1.15,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.0833333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.2833333333333334
																	}
																},
																{
																	"time": 2,
																	"value": 0.95,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "ref",
													"scaleX": 1.825,
													"scaleY": 1.825,
													"scaleZ": 1.825,
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
																"texture": "Fx/Alphas/T-InnerGradient.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.8954732510288089,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.12993141289437626
																			},
																			"nextHandle": {
																				"dv": -4.2798854282701573e-16,
																				"dt": 0.36817558299039704
																			}
																		},
																		{
																			"time": 2,
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
															"enabled": false,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8954732510288089,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.29849108367626964
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.36817558299039704
																	}
																},
																{
																	"time": 2,
																	"value": 1,
																	"mode": 0
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
								}
							]
						},
						{
							"type": "object",
							"name": "Test4",
							"enabled": false,
							"x": -0.004778888888888888,
							"y": -0.022278888888888883,
							"z": -0.49668999999999996,
							"children": [
								{
									"type": "object",
									"name": "RightCorner",
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
													"name": "polygon_DottedLines",
													"x": -2.2204460492503128e-16,
													"y": -5.201618254545842e-32,
													"scaleX": 0.625,
													"scaleY": 0.6249999999999998,
													"scaleZ": 0.625,
													"rotationX": 90,
													"rotationY": 18.708748264532325,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.11504801097393731,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.75,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 4.0013458835490066e-16,
																				"dt": -0.49010203019371373
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.365
																			}
																		},
																		{
																			"time": 2,
																			"value": 0.6,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.11504801097393731,
																	"value": 0.6,
																	"mode": 2
																},
																{
																	"time": 0.75,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.0013458835490066e-16,
																		"dt": -0.49010203019371373
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.365
																	}
																},
																{
																	"time": 1.25,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 2,
																	"value": 0.6,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_2",
													"scaleX": 0.6999999999999997,
													"scaleY": 0.6999999999999997,
													"scaleZ": 0.7,
													"rotationX": -89.99999999999997,
													"rotationY": -26.323708890336036,
													"rotationZ": -90.00000000000004,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.27742112482853293,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.0394513031550097,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 4.0013458835490066e-16,
																				"dt": -0.49010203019371373
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.365
																			}
																		},
																		{
																			"time": 2,
																			"value": 0.6,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.27658436213991855,
																	"value": 0.8,
																	"mode": 2
																},
																{
																	"time": 1.0399999999999996,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.0013458835490066e-16,
																		"dt": -0.49010203019371373
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.365
																	}
																},
																{
																	"time": 1.59,
																	"value": 0.8,
																	"mode": 0
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.8,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_DottedLines",
													"scaleY": 0.9999999999999999,
													"scaleZ": 1.0000000000000002,
													"rotationX": -7.061204112370308e-15,
													"rotationY": 89.568,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.5056790123456804,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.239615912208508,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 4.0013458835490066e-16,
																				"dt": -0.49010203019371373
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.365
																			}
																		},
																		{
																			"time": 2,
																			"value": 0.6,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.5057681755829897,
																	"value": 0.8,
																	"mode": 2
																},
																{
																	"time": 1.2557681755829897,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.0013458835490066e-16,
																		"dt": -0.49010203019371373
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.365
																	}
																},
																{
																	"time": 1.75576817558299,
																	"value": 0.8,
																	"mode": 0
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.8,
																	"mode": 0
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.7093552812071349,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.457338820301787,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 4.0013458835490066e-16,
																				"dt": -0.49010203019371373
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.365
																			}
																		},
																		{
																			"time": 2,
																			"value": 0.6,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.707791495198903,
																	"value": 0.8,
																	"mode": 2
																},
																{
																	"time": 1.457791495198903,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.0013458835490066e-16,
																		"dt": -0.49010203019371373
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.365
																	}
																},
																{
																	"time": 1.957791495198903,
																	"value": 0.8,
																	"mode": 0
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.8,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "ref",
													"scaleX": 1.48,
													"scaleY": 1.48,
													"scaleZ": 1.48,
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
																"texture": "Fx/Alphas/T-InnerGradient.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.295,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.4881550068587083
																			},
																			"nextHandle": {
																				"dv": -2.7213044487563777e-16,
																				"dt": 0.23409922267947142
																			}
																		},
																		{
																			"time": 1.9972976680384142,
																			"value": 0,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 1.295,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.0013458835490066e-16,
																		"dt": -0.49010203019371373
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.365
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.2,
																	"mode": 0
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
											}
										}
									]
								},
								{
									"type": "object",
									"name": "RightCorner",
									"enabled": false,
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
													"name": "polygon_DottedLines",
													"x": -2.2204460492503128e-16,
													"y": -5.201618254545842e-32,
													"scaleX": 0.625,
													"scaleY": 0.6249999999999998,
													"scaleZ": 0.625,
													"rotationX": 90,
													"rotationY": 18.708748264532325,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.6,
																	"mode": 2
																},
																{
																	"time": 0.75,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.0013458835490066e-16,
																		"dt": -0.49010203019371373
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.365
																	}
																},
																{
																	"time": 1.25,
																	"value": 0.6,
																	"mode": 0
																},
																{
																	"time": 2,
																	"value": 0.6,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_2",
													"scaleX": 0.6999999999999997,
													"scaleY": 0.6999999999999997,
													"scaleZ": 0.7,
													"rotationX": -89.99999999999997,
													"rotationY": -26.323708890336036,
													"rotationZ": -90.00000000000004,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.2899999999999996,
																	"value": 0.8,
																	"mode": 2
																},
																{
																	"time": 1.0399999999999996,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.0013458835490066e-16,
																		"dt": -0.49010203019371373
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.365
																	}
																},
																{
																	"time": 1.59,
																	"value": 0.8,
																	"mode": 0
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.8,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_DottedLines",
													"scaleY": 0.9999999999999999,
													"scaleZ": 1.0000000000000002,
													"rotationX": -7.061204112370308e-15,
													"rotationY": 89.568,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.4249999999999998,
																	"value": 0.8,
																	"mode": 2
																},
																{
																	"time": 1.1749999999999998,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.0013458835490066e-16,
																		"dt": -0.49010203019371373
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.365
																	}
																},
																{
																	"time": 1.675,
																	"value": 0.8,
																	"mode": 0
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.8,
																	"mode": 0
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
														},
														{
															"type": "curve",
															"name": "scale",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.6200000000000001,
																	"value": 0.8,
																	"mode": 2
																},
																{
																	"time": 1.37,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.0013458835490066e-16,
																		"dt": -0.49010203019371373
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.365
																	}
																},
																{
																	"time": 1.87,
																	"value": 0.8,
																	"mode": 0
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.8,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_Circle",
													"enabled": false,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.875,
																	"value": 0.9,
																	"mode": 2
																},
																{
																	"time": 1.5450000000000004,
																	"value": 1.1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.0013458835490066e-16,
																		"dt": -0.49010203019371373
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.365
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.9,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "ref",
													"enabled": false,
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
															"enabled": false,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 1.295,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.0013458835490066e-16,
																		"dt": -0.49010203019371373
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.365
																	}
																},
																{
																	"time": 1.54,
																	"value": 1,
																	"mode": 0
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
												"alpha": 0.4
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Test1",
							"enabled": false,
							"x": -0.004778888888888888,
							"y": -0.022278888888888883,
							"z": -0.49668999999999996,
							"children": [
								{
									"type": "object",
									"name": "RightCorner",
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
													"name": "polygon_DottedLines",
													"x": -2.2204460492503128e-16,
													"y": -5.201618254545842e-32,
													"scaleX": 0.625,
													"scaleY": 0.6249999999999998,
													"scaleZ": 0.625,
													"rotationX": 90,
													"rotationY": 18.708748264532325,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.6799999999999999,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.72,
																			"value": 1.25,
																			"mode": 2
																		},
																		{
																			"time": 0.755,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.6,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.25
																	}
																},
																{
																	"time": 0.75,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.0013458835490066e-16,
																		"dt": -0.49010203019371373
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.365
																	}
																},
																{
																	"time": 1.25,
																	"value": 0.6,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.25
																	}
																},
																{
																	"time": 2,
																	"value": 0.6,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_2",
													"scaleX": 0.6999999999999997,
													"scaleY": 0.6999999999999997,
													"scaleZ": 0.7,
													"rotationX": -89.99999999999997,
													"rotationY": -26.323708890336036,
													"rotationZ": -90.00000000000004,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.94,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.95,
																			"value": 1.25,
																			"mode": 2
																		},
																		{
																			"time": 0.96,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 1,
															"loop": true,
															"keys": [
																{
																	"time": 0.2899999999999996,
																	"value": 0.8,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.25
																	}
																},
																{
																	"time": 1.0399999999999996,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.0013458835490066e-16,
																		"dt": -0.49010203019371373
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.365
																	}
																},
																{
																	"time": 1.59,
																	"value": 0.8,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.1833333333333335
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.13666666666666658
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.8,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_DottedLines",
													"scaleY": 0.9999999999999999,
													"scaleZ": 1.0000000000000002,
													"rotationX": -7.061204112370308e-15,
													"rotationY": 89.568,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.2650000000000001,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.2750000000000001,
																			"value": 1.25,
																			"mode": 2
																		},
																		{
																			"time": 1.2850000000000001,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.4249999999999998,
																	"value": 0.8,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.25
																	}
																},
																{
																	"time": 1.1749999999999998,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.0013458835490066e-16,
																		"dt": -0.49010203019371373
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.365
																	}
																},
																{
																	"time": 1.675,
																	"value": 0.8,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666674
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.10833333333333324
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.8,
																	"mode": 0
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.2599999999999998,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.2699999999999998,
																			"value": 1.25,
																			"mode": 2
																		},
																		{
																			"time": 1.2799999999999998,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.6200000000000001,
																	"value": 0.8,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.25
																	}
																},
																{
																	"time": 1.37,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.0013458835490066e-16,
																		"dt": -0.49010203019371373
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.365
																	}
																},
																{
																	"time": 1.87,
																	"value": 0.8,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.043333333333333224
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.8,
																	"mode": 0
																}
															]
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.0099999999999998,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.0199999999999998,
																			"value": 1.25,
																			"mode": 2
																		},
																		{
																			"time": 1.0299999999999998,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.895,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.905,
																			"value": 1.25,
																			"mode": 2
																		},
																		{
																			"time": 1.915,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.875,
																	"value": 0.9,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.22333333333333347
																	}
																},
																{
																	"time": 1.5450000000000004,
																	"value": 1.1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.0013458835490066e-16,
																		"dt": -0.49010203019371373
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.365
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.9,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.15166666666666648
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.15166666666666648
																	}
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
											"enabled": false,
											"props": {
												"alpha": 0.75
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Pulse",
							"enabled": false,
							"x": -0.004778888888888888,
							"y": -0.022278888888888883,
							"z": -0.49668999999999996,
							"children": [
								{
									"type": "object",
									"name": "PulseSmall",
									"children": [
										{
											"type": "lookAt",
											"name": "lookAt",
											"scaleY": 0.9999999999999999,
											"rotationX": 1.6721165498415313e-15,
											"rotationY": -18,
											"rotationZ": 44.6562253229215,
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
													"x": -2.2204460492503128e-16,
													"y": -5.201618254545842e-32,
													"scaleX": 0.6,
													"scaleY": 0.6,
													"scaleZ": 0.6,
													"rotationX": 90,
													"rotationY": 18.708748264532325,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.25,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.5,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.18500000000000005
																			},
																			"nextHandle": {
																				"dv": -6.69672683488781e-17,
																				"dt": 0.20506096654409864
																			}
																		},
																		{
																			"time": 0.75,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.5,
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
																	"time": 500,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.25,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333333
																	}
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.14181069958847642
																	},
																	"nextHandle": {
																		"dv": -9.313060688508117e-18,
																		"dt": 0.16023052980660232
																	}
																},
																{
																	"time": 0.75,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.4166666666666667
																	}
																},
																{
																	"time": 2,
																	"value": 0.95,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_2",
													"scaleX": 0.8,
													"scaleY": 0.8,
													"scaleZ": 0.8,
													"rotationX": -89.99999999999997,
													"rotationY": -26.323708890336036,
													"rotationZ": -90.00000000000004,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.35,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.6,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.837423715626769e-17,
																				"dt": -0.22505554869853764
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.22499999999999987
																			}
																		},
																		{
																			"time": 0.85,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.35,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.6,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.837423715626769e-17,
																				"dt": -0.22505554869853764
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.22499999999999987
																			}
																		},
																		{
																			"time": 0.85,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.35,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333333
																	}
																},
																{
																	"time": 0.6,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 3.36737436272209e-18,
																		"dt": -0.11587086055649083
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.1550068587105644
																	}
																},
																{
																	"time": 0.85,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3833333333333333
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_DottedLines",
													"rotationX": -7.061204112370308e-15,
													"rotationY": 89.568,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.40517940054017104,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.40517940054017104,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.655179400540171,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 0.655179400540171,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0031697890191121143,
																				"dt": -0.1949420246753946
																			},
																			"nextHandle": {
																				"dv": -0.0033333333333332993,
																				"dt": 0.20500000000000007
																			}
																		},
																		{
																			"time": 0.905179400540171,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 0.905179400540171,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.40517940054017104,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.40517940054017104,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.655179400540171,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 0.655179400540171,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0031697890191121143,
																				"dt": -0.1949420246753946
																			},
																			"nextHandle": {
																				"dv": -0.0033333333333332993,
																				"dt": 0.20500000000000007
																			}
																		},
																		{
																			"time": 0.905179400540171,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 0.905179400540171,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 1,
															"loop": true,
															"keys": [
																{
																	"time": 0.40517940054017104,
																	"value": 0.95,
																	"mode": 0
																},
																{
																	"time": 0.40517940054017104,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 0.6649999999999999,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.09994019981994297
																	},
																	"nextHandle": {
																		"dv": 0.0008333333333332416,
																		"dt": 0.09999999999999998
																	}
																},
																{
																	"time": 0.905179400540171,
																	"value": 0.95,
																	"mode": 0
																},
																{
																	"time": 0.905179400540171,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.43569218338372395,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.43569218338372395,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.43569218338372395,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.735692183383724,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 0.735692183383724,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 0.735692183383724,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.5920408388915597e-17,
																				"dt": -0.19500000000000006
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.20499999999999985
																			}
																		},
																		{
																			"time": 0.985692183383724,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 0.985692183383724,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 0.985692183383724,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.43569218338372395,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.43569218338372395,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.43569218338372395,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.735692183383724,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 0.735692183383724,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 0.735692183383724,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.5920408388915597e-17,
																				"dt": -0.19500000000000006
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.20499999999999985
																			}
																		},
																		{
																			"time": 0.985692183383724,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 0.985692183383724,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 0.985692183383724,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
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
																	0.43137254901960786,
																	0.2196078431372549,
																	0.10588235294117647
																]
															}
														},
														{
															"type": "curve",
															"name": "rotation.x",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 150,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -50
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 50
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 1,
															"loop": true,
															"keys": [
																{
																	"time": 0.43569218338372395,
																	"value": 0.95,
																	"mode": 0
																},
																{
																	"time": 0.43569218338372395,
																	"value": 0.95,
																	"mode": 0
																},
																{
																	"time": 0.43569218338372395,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.10000000000000002
																	}
																},
																{
																	"time": 0.735692183383724,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.0008333333333332416,
																		"dt": -0.110692183383724
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.10430781661627597
																	}
																},
																{
																	"time": 0.985692183383724,
																	"value": 0.95,
																	"mode": 0
																},
																{
																	"time": 0.985692183383724,
																	"value": 0.95,
																	"mode": 0
																},
																{
																	"time": 0.985692183383724,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3166666666666666
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_Dots",
													"enabled": false,
													"scaleX": 1.4,
													"scaleY": 1.4,
													"scaleZ": 1.4,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.65,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.9,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.2250000000000001
																			},
																			"nextHandle": {
																				"dv": -3.9188697572715314e-17,
																				"dt": 0.24
																			}
																		},
																		{
																			"time": 1.15,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.65,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.9,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.2250000000000001
																			},
																			"nextHandle": {
																				"dv": -3.9188697572715314e-17,
																				"dt": 0.24
																			}
																		},
																		{
																			"time": 1.15,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.5,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.65,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333333
																	}
																},
																{
																	"time": 0.9,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0007594883770492254,
																		"dt": -0.13442006633799564
																	},
																	"nextHandle": {
																		"dv": -0.0008333333333333526,
																		"dt": 0.14647462277092183
																	}
																},
																{
																	"time": 1.15,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.0833333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.2833333333333334
																	}
																},
																{
																	"time": 2,
																	"value": 0.95,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "ref",
													"enabled": false,
													"scaleX": 1.825,
													"scaleY": 1.825,
													"scaleZ": 1.825,
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
																"texture": "Fx/Alphas/T-InnerGradient.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.5541068403328583,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 0.8954732510288089,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.12993141289437626
																			},
																			"nextHandle": {
																				"dv": -4.2798854282701573e-16,
																				"dt": 0.36817558299039704
																			}
																		},
																		{
																			"time": 2,
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
															"enabled": false,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8954732510288089,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.29849108367626964
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.36817558299039704
																	}
																},
																{
																	"time": 2,
																	"value": 1,
																	"mode": 0
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
												"alpha": 1
											}
										}
									]
								},
								{
									"type": "object",
									"name": "PulseBig",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
									"children": [
										{
											"type": "lookAt",
											"name": "lookAt",
											"scaleY": 0.9999999999999999,
											"rotationX": 1.6841764469393999e-15,
											"rotationY": -19.222652143119696,
											"rotationZ": 44.6562253229215,
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
													"x": -2.2204460492503128e-16,
													"y": -5.201618254545842e-32,
													"scaleX": 0.6,
													"scaleY": 0.6,
													"scaleZ": 0.6,
													"rotationX": 90,
													"rotationY": 18.708748264532325,
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
																"texture": "Fx/Alphas/T_UI_Circle_DottedLines_2048.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 1.04,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 1.29,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.18500000000000005
																			},
																			"nextHandle": {
																				"dv": -6.69672683488781e-17,
																				"dt": 0.20506096654409864
																			}
																		},
																		{
																			"time": 1.54,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 2,
																			"value": 0.5,
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
																	"time": 500,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.04,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333333
																	}
																},
																{
																	"time": 1.29,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.14181069958847642
																	},
																	"nextHandle": {
																		"dv": -9.313060688508117e-18,
																		"dt": 0.16023052980660232
																	}
																},
																{
																	"time": 1.54,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.4166666666666667
																	}
																},
																{
																	"time": 2,
																	"value": 0.95,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_2",
													"scaleX": 0.8,
													"scaleY": 0.8,
													"scaleZ": 0.8,
													"rotationX": -89.99999999999997,
													"rotationY": -26.323708890336036,
													"rotationZ": -90.00000000000004,
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
																"texture": "Fx/Alphas/T_UI_Circle_2_2048.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 1.1400000000000001,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.3900000000000001,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.837423715626769e-17,
																				"dt": -0.22505554869853764
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.22499999999999987
																			}
																		},
																		{
																			"time": 1.6400000000000001,
																			"value": 0.25,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.25,
																			"mode": 0
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"loop": true,
																	"keys": [
																		{
																			"time": 1.1400000000000001,
																			"value": 0.5,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.08333333333333333
																			}
																		},
																		{
																			"time": 1.3900000000000001,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.008333333333333304,
																				"dt": -0.18500000000000028
																			},
																			"nextHandle": {
																				"dv": -0.008567275864239573,
																				"dt": 0.1901935241861185
																			}
																		},
																		{
																			"time": 1.6400000000000001,
																			"value": 0.5,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.10833333333333317
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.1400000000000001,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333333
																	}
																},
																{
																	"time": 1.3900000000000001,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 3.36737436272209e-18,
																		"dt": -0.11587086055649083
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.1550068587105644
																	}
																},
																{
																	"time": 1.6400000000000001,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3833333333333333
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon_DottedLines",
													"rotationX": -7.061204112370308e-15,
													"rotationY": 89.568,
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
																"texture": "Fx/Alphas/T_UI_Circle_DottedLines_2048.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 1,
																	"loop": true,
																	"keys": [
																		{
																			"time": 1.195179400540171,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 1.195179400540171,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 1.48,
																			"value": 1,
																			"mode": 1,
																			"prevHandle": {
																				"dv": -0.008333333333333304,
																				"dt": -0.15000000000000013
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.14500000000000002
																			}
																		},
																		{
																			"time": 1.695179400540171,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 1.695179400540171,
																			"value": 0.5,
																			"mode": 0
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
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
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 1,
															"loop": true,
															"keys": [
																{
																	"time": 1.195179400540171,
																	"value": 0.95,
																	"mode": 0
																},
																{
																	"time": 1.195179400540171,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.020538999289462e-17,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.06982059945982888
																	}
																},
																{
																	"time": 1.445179400540171,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.0008333333333332416,
																		"dt": -0.12017940054017129
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.15482059945982884
																	}
																},
																{
																	"time": 1.695179400540171,
																	"value": 0.95,
																	"mode": 0
																},
																{
																	"time": 1.695179400540171,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
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
																"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 1,
																	"loop": true,
																	"keys": [
																		{
																			"time": 1.2751794005401715,
																			"value": 0.5,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.020538999289462e-17,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.06982059945982888
																			}
																		},
																		{
																			"time": 1.5251794005401715,
																			"value": 1,
																			"mode": 1,
																			"prevHandle": {
																				"dv": 0.0008333333333332416,
																				"dt": -0.12017940054017129
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.15482059945982884
																			}
																		},
																		{
																			"time": 1.7751794005401715,
																			"value": 0.5,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3499999999999999
																			}
																		},
																		{
																			"time": 1.9999999999999998,
																			"value": 0.5,
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
																	0.43137254901960786,
																	0.2196078431372549,
																	0.10588235294117647
																]
															}
														},
														{
															"type": "curve",
															"name": "rotation.x",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 150,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -50
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 50
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 1,
															"loop": true,
															"keys": [
																{
																	"time": 1.2751794005401715,
																	"value": 0.95,
																	"mode": 0
																},
																{
																	"time": 1.2751794005401715,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.020538999289462e-17,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.06982059945982888
																	}
																},
																{
																	"time": 1.5251794005401715,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.0008333333333332416,
																		"dt": -0.12017940054017129
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.15482059945982884
																	}
																},
																{
																	"time": 1.7751794005401715,
																	"value": 0.95,
																	"mode": 0
																},
																{
																	"time": 1.7751794005401715,
																	"value": 0.95,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0.95,
																	"mode": 0
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
											}
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
							1,
							1,
							1
						]
					}
				},
				{
					"type": "lookAt",
					"name": "lookAt",
					"enabled": false,
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.5,
					"lockAxis": [
						0,
						0,
						0
					],
					"children": [
						{
							"type": "model",
							"name": "SandSwoosh",
							"source": "Fx/UI/SandSwoosh.fbx",
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
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
											"textureWrap": true
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
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
										"texture": "Fx/Gradients/Cyl03u_A.jpg"
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.33,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Alphas/TS_Dust_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.48,
										"saturation": 0.22,
										"width": 1,
										"uvScaleX": 5,
										"uvScaleY": 5,
										"texture": "Fx/Alphas/Dust03.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-1
										]
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
										"useScale": false,
										"wrap": true,
										"progress": 0.33,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 5,
										"uvScaleY": 5,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									},
									"isInstance": true
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
										"shiftSpeedX": 0,
										"shiftSpeedY": -0.6
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVSweep",
									"source": "shaders/UVSweep.hx",
									"enabled": false,
									"props": {
										"saturation": 1,
										"width": 1,
										"useU": false,
										"progress": 0.43
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