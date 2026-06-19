trigger LeadTrigger on Lead (after insert) {
    if (Trigger.isAfter && Trigger.isInsert) {
        LeadAssignmentHandler.handleAfterInsert(Trigger.new);
    }
}
