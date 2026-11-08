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
					"name": "Siren",
					"source": "Vehicle/Ecaz/Siren/Siren.fbx",
					"editorOnly": true,
					"scaleX": 1.4,
					"scaleY": 1.4,
					"scaleZ": 1.4,
					"rotationZ": 90,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Siren/Anim_Siren_Run.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Reactor",
					"y": 0.89164,
					"z": -3.47301,
					"rotationY": -89.7,
					"children": [
						{
							"type": "model",
							"name": "Reactor_Big",
							"source": "Fx/Meshes_Common/Reactor_Siren.fbx",
							"scaleY": 2.5,
							"rotationX": -89.99999999999999,
							"rotationY": 89.99999999999999,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 0.5
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.2,
										"saturation": 1,
										"width": 0.2,
										"uvScaleX": 0.3,
										"uvScaleY": 0.3,
										"texture": "Fx/noise/T_Noise_Voronoi_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											1.5,
											1
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
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": -1,
										"texture": "Fx/Gradients/Gradient_Spotlight.png",
										"uvShift": [
											0,
											-0.01
										],
										"uvShiftSpeed": [
											2,
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.00784313725490196,
											0.2,
											0.5568627450980392
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "model",
							"name": "Reactor_Little",
							"source": "Fx/Meshes_Common/Reactor_Siren.fbx",
							"scaleX": 0.8,
							"scaleY": 1.7,
							"scaleZ": 0.8,
							"rotationX": -89.99999999999999,
							"rotationY": 89.99999999999999,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 1.8
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.2,
										"saturation": 1,
										"width": 0.2,
										"uvScaleX": 0.6,
										"uvScaleY": 0.6,
										"texture": "Fx/noise/T_Noise_Voronoi_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											3,
											2
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
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": -1,
										"texture": "Fx/Gradients/Gradient_Spotlight.png",
										"uvShift": [
											0,
											-0.01
										],
										"uvShiftSpeed": [
											2,
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0.3529411764705882,
											0.9921568627450981
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "trails",
							"name": "trails_LB",
							"x": -0.22174,
							"startWidth": 0.4,
							"lifetime": 0.9,
							"minSpeed": 5,
							"maxSpeed": 100,
							"uvRepeat": "EClamp",
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/uGrad_inv.png"
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
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.9999999999999998,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.01,
											"value": 1,
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
											0,
											0.2627450980392157,
											0.45098039215686275
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
					"object": "FXAnimation.FXRoot.Reactor",
					"target": "FXAnimation.FXRoot.Siren.root.B_ROOTJ"
				}
			]
		}
	]
}