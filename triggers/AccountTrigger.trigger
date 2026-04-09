trigger AccountTrigger on Account (before insert) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AccountGuidHandler.assignGuids(Trigger.new);
    }
}
