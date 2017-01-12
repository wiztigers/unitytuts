using UnityEngine;

public class Rotator : MonoBehaviour {
	// we don't use physics, so use Update instead of FixedUpdate
	void Update() {
		transform.Rotate(new Vector3(15, 30, 45) * Time.deltaTime);
	}
}
