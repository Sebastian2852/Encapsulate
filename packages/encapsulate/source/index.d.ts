export = Encapsulate;
export as namespace Encapsulate;

declare namespace Encapsulate {
  type capsule<T> = (newValue?: T | ((currentValue: T) => T)) => T;
  type capsuleChangedCallback<T> = (prevValue: T, newValue: T) => void;

  /**
   * Create a capsule with an initial state. The state can be pretty much anything.
   *
   * @param initialValue Initial value of the capsule.
   * @returns a new capsule.
   */
  function createCapsule<T>(initialValue: T): capsule<T>;

  /**
   * Listen to changes from the passed `capsule` and run the `callback` when state changes.
   *
   * @param capsule capsule to watch state changes
   * @param callback function to run when state changes
   * @returns a cleanup function
   */
  function onCapsuleChanged<T>(
    capsule: capsule<T>,
    callback: capsuleChangedCallback<T>,
  ): () => void;
}
