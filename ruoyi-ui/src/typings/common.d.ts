/** The common type namespace */
declare namespace Common {
  /** The strategic pattern */
  interface StrategicPattern {
    /** The condition */
    condition: boolean;
    /** If the condition is true, then call the action function */
    callback: () => void;
  }

  /**
   * The option type
   *
   * @property value: The option value
   * @property label: The option label
   */
  type Option<K> = { value: K; label: string };

  type YesOrNo = 'Y' | 'N';
}
