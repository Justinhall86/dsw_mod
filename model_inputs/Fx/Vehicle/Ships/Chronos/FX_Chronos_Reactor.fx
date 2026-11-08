{
	"type": "fx",
	"cullingRadius": 20,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Lights",
					"children": [
						{
							"type": "object",
							"name": "Reactor",
							"z": -3.79969,
							"children": [
								{
									"type": "model",
									"name": "ReactorHexagone",
									"source": "Fx/Meshes_Common/ReactorTriangle.fbx",
									"y": -0.09847,
									"z": 0.2,
									"scaleX": 1.1,
									"scaleY": 1.1,
									"rotationY": 90,
									"rotationZ": -90,
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
													"depthTest": "Less",
													"emissive": 1.5
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
												"wrap": true,
												"invert": true,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/circGrad05.jpg",
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
												"progress": 0.69,
												"saturation": 1,
												"width": 0.86,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/perlin06.png",
												"uvShift": [
													0,
													0
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.9019607843137255,
													1
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "ReactorHexagone",
									"source": "Fx/Meshes_Common/ReactorTriangle.fbx",
									"y": -0.09847,
									"z": 0.18,
									"scaleX": 1.1,
									"scaleY": 1.1,
									"rotationY": 90,
									"rotationZ": -90,
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
													"depthTest": "Less",
													"emissive": 1.5
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
												"wrap": true,
												"invert": true,
												"replace": false,
												"alpha": 0.2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/circGrad05.jpg",
												"onDecal": false
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
													0,
													0.9019607843137255,
													1
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "ReactorHexagoneTube",
									"source": "Fx/Meshes_Common/ReactorTriangle_Tube.fbx",
									"y": 0.35635,
									"z": 0.18052,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.5,
									"rotationY": 90,
									"rotationZ": 90,
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
													"emissive": 1.5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.9019607843137255,
													1
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
												"useScale": false,
												"wrap": true,
												"progress": 0.32,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl15u_A.png",
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
											"isInstance": true
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
								}
							]
						},
						{
							"type": "model",
							"name": "Cronos_Lights",
							"source": "Fx/Meshes_Common/Cronos_Lights.fbx",
							"x": 0.08087,
							"y": -0.98167,
							"rotationX": -90,
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
											"parallax": 0,
											"emissive": 1
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.6941176470588235,
											0.4784313725490196
										]
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Chronos",
					"source": "Vehicle/Imperial/Chronos/Chronos.fbx",
					"editorOnly": true,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Chronos/Anim_Chronos_Idle.fbx"
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"enabled": false,
							"props": {
								"RGB": true,
								"ALPHA": false,
								"REVERSE": true,
								"bias": 0.36,
								"scale": 0.17,
								"power": 0.25,
								"color": [
									0.8784313725490196,
									1,
									0.8117647058823529
								]
							}
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Lights",
					"target": "FXAnimation.FXRoot.Chronos.root.B_ROOT.B_Body"
				}
			]
		}
	]
}